import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() =>
      FirebaseFirestore.instance.collection("tasks").withConverter(
            fromFirestore: (snapshot, options) =>
                TaskModel.fromJson(snapshot.data()!),
            toFirestore: (taskModel, _) => taskModel.toJson(),
          );

  static Future<void> addTaskToFirestore(TaskModel task) {
    CollectionReference<TaskModel> taskCollection = getTaskCollection();
    DocumentReference<TaskModel> doc = taskCollection.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  static Future<List<TaskModel>> getTaskFromFirestore() async {
    CollectionReference<TaskModel> taskCollection = getTaskCollection();
    QuerySnapshot<TaskModel> querySnapshot = await taskCollection.get();
    return querySnapshot.docs
        .map(
          (docSnapshot) => docSnapshot.data(),
        )
        .toList();
  }
}
