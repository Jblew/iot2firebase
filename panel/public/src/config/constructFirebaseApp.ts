import * as firebase from 'firebase/app';
import 'firebase/firestore';
import 'firebase/auth';
import 'firebase/database';

const FIREBASE_CONFIG = {
  apiKey: 'AIzaSyBA-qMv8y8CkATXD2iLfFVhxcoUQHYiPxQ',
  authDomain: 'things2firebase.firebaseapp.com',
  databaseURL: 'https://things2firebase.firebaseio.com',
  projectId: 'things2firebase',
  storageBucket: 'things2firebase.appspot.com',
  messagingSenderId: '444497663',
  appId: '1:444497663:web:5ee211a2b0caefa07716ca',
};

export function constructFirebaseApp() {
  return firebase.initializeApp(FIREBASE_CONFIG);
}
