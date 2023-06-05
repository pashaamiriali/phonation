class ListeningTask {
  final String instruction;
  final bool done;

  ListeningTask(this.instruction, this.done);
}

class ListenToAudioTask extends ListeningTask {
  ListenToAudioTask(
      super.instruction, super.done, this.audioFileName, this.transcript);

  final String audioFileName;
  final String transcript;
}

class MatchingTask extends ListeningTask {
  MatchingTask(
      super.instruction, super.done, this.questionItems, this.answerItems);

  final List<String> questionItems;
  final List<TaskMatchableItem> answerItems;
}

class TaskMatchableItem {
  final String content;
  final int correctIndex;

  TaskMatchableItem(this.content, this.correctIndex);
}

class SortingTask extends ListeningTask {
  SortingTask(super.instruction, super.done, this.questionsCorrectOrder);

  final List<String> questionsCorrectOrder;
}

class MultipleChoiceTask extends ListeningTask {
  MultipleChoiceTask(super.instruction, super.done, this.questions);

  final List<MultipleChoiceQuestion> questions;
}

class MultipleChoiceQuestion {
  final String question;
  final List<String> choices;
  final int correctAnswerIndex;

  MultipleChoiceQuestion(this.question, this.choices, this.correctAnswerIndex);
}

class SelectTypeTask extends ListeningTask {
  SelectTypeTask(super.instruction, super.done, this.items, this.types);

  final List<SelectTypeItem> items;
  final List<SelectTypeTaskType> types;
}

class SelectTypeItem {
  final String title;
  final SelectTypeTaskType correctType;

  SelectTypeItem(this.title, this.correctType);
}

class SelectTypeTaskType {
  final String title;

  SelectTypeTaskType(this.title);
}
