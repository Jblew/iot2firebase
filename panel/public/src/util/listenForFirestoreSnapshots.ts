import { Resource } from 'vue-stateful-resource';
import firebase from 'firebase/app';

export function listenForFirestoreSnapshots<T>(
  query: firebase.firestore.Query,
  processDocuments: (docs: firebase.firestore.QueryDocumentSnapshot[]) => T[],
  cb: (res: Resource<T[]>) => void,
) {
  cb(Resource.loading());

  query.onSnapshot(
    (snapshot) => {
      cb(Resource.success(processDocuments(snapshot.docs)));
    },
    (error) => {
      cb(Resource.error(error.message));
    },
  );
}
