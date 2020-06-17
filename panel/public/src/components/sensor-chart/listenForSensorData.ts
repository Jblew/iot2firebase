import { Resource } from 'vue-stateful-resource';
import firebase from 'firebase/app';
import { projectConfig } from '@/config';
import { listenForFirestoreSnapshots } from '@/util';
import { SensorRow } from '@/types';

export const listenForSensorData = (cb: (res: Resource<SensorRow[]>) => void) =>
  listenForFirestoreSnapshots(getQuery(), processDocuments, cb);

function getQuery() {
  return getCollection()
    .limit(projectConfig.showNumberOfRows)
    .orderBy(projectConfig.orderBy.field, projectConfig.orderBy.dir);
}

function processDocuments(docs: firebase.firestore.QueryDocumentSnapshot[]) {
  return docs.map((doc) => doc.data() as SensorRow);
}

function getCollection() {
  return firebase.firestore().collection(projectConfig.sensorsCollection);
}
