from flask import Flask, jsonify, request
import pandas as pd
import numpy as np
import joblib
import traceback
import sys
from flask_restful import reqparse
app = Flask(__name__)
output = []
@app.route('/', methods=['GET'])
def hello():
 return 'Home'

@app.route('/predictADS', methods=['POST'])
def predict():
 if lr:
  try:
     json = request.get_json()
     temp=list(json[0].values())
     vals=np.array(temp)
     for i in range(0, len(vals)):
        vals[i] = float(vals[i])
     prediction = lr.predict([vals]) 
     return jsonify({'prediction': str(prediction[0])})
  except: 
     return jsonify({'trace': traceback.format_exc()})
 else:
  print ('Train the model first')
  return ('No model here to use')

@app.route('/predictDS', methods=['POST'])
def predictDS():
 if ds:
  try:
     json = request.get_json()
     temp=list(json[0].values())
     vals=np.array(temp)
     for i in range(0, len(vals)):
        vals[i] = float(vals[i])
     prediction = ds.predict([vals]) 
     return jsonify({'prediction': str(prediction[0])})
  except: 
     return jsonify({'trace': traceback.format_exc()})
 else:
  print ('Train the model first')
  return ('No model here to use')

@app.route('/predictDSLab', methods=['POST'])
def predictDSLab():
 if dslab:
  try:
     json = request.get_json()
     temp=list(json[0].values())
     vals=np.array(temp)
     for i in range(0, len(vals)):
        vals[i] = float(vals[i])
     prediction = dslab.predict([vals]) 
     return jsonify({'prediction': str(prediction[0])})
  except: 
     return jsonify({'trace': traceback.format_exc()})
 else:
  print ('Train the model first')
  return ('No model here to use')

def inverse_difference(history, yhat, interval=1):
    return yhat + history[-interval]

@app.route('/predictPower', methods=['POST'])
def predictPower():
 if lr:
  try:
     json = request.get_json()
     temp=list(json[0].values())
     vals=np.array(temp)
     for i in range(0, len(vals)):
        vals[i] = int(vals[i])
     x = vals[2]
     output = power.predict(vals[0],vals[1])
     if(x==91):
       output = output[1:]
     elif(x==182):
       output = output[92:]
     elif(x==274):
       output = output[183:]
     elif(x==366):
       output = output[275:]
     elif(x==456):
       output = output[367:]
     elif(x==547):
       output = output[457:]
     elif(x==639):
       output = output[548:]
     elif(x==731):
       output = output[640:]
     df = pd.read_csv('power.csv', parse_dates = ['date'], index_col = ['date'])
     df = df.fillna(method='pad')
     train_data = df['Daily Consumption']
     actualPrediction = []
     history = list(train_data)
     for f in output:
       yPredict = inverse_difference(history, f,30)
       actualPrediction.append(yPredict)
       history.append(yPredict)
     print(actualPrediction)
     return jsonify({'prediction': actualPrediction})
  except: 
     return jsonify({'trace': traceback.format_exc()})
 else:
  print ('Train the model first')
  return ('No model here to use')


if __name__ == '__main__':
 lr = joblib.load('ADS.pkl')
 ds = joblib.load('ds.pkl')
 dslab = joblib.load('dslab.pkl')
 power = joblib.load('power.pkl')
 #The following line is very important
 app.run(debug=True, host='0.0.0.0',port = 5000)