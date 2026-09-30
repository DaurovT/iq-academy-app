// Данные макетов раздела «Обучение» (Learn/Course/Lesson/Test*).
import 'package:platform_app/core/models/learn.dart';

const learnTitle = 'Доритрицин (Андижан)';
const learnDesc =
    'Доритрицин — комплексный препарат для лечения инфекционно-воспалительных заболеваний горла';
const lessonText =
    'Острый тонзиллофарингит — воспаление слизистой оболочки инфекционного генеза, главный симптом которого — боль в горле, усиливающаяся при глотании. В 50–80% случаев тонзиллофарингит имеет вирусное происхождение…';

const learnLessons = [
  Lesson(
    id: 11,
    title: learnTitle,
    kind: 'video',
    durationMin: 6,
    completed: false,
    rewardIqc: 0,
    videoDurationSec: 332,
    videoUrl: 'https://vimeo.com/1',
  ),
  Lesson(
    id: 12,
    title: 'Тест',
    kind: 'quiz',
    durationMin: 0,
    completed: false,
    rewardIqc: 30,
    locked: true,
  ),
];

const learnCourse = Course(
  id: 7,
  title: learnTitle,
  description: learnDesc,
  lessonCount: 2,
  progress: 0,
  ownerBrand: 'Medice',
);

CourseDetail learnDetail({String description = '$learnDesc.'}) => CourseDetail(
  id: 7,
  title: learnTitle,
  description: description,
  lessonCount: 2,
  progress: 0,
  ownerBrand: 'Medice',
  lessons: learnLessons,
);

/// Для LearnNoResults: курсы есть в других вкладках, в «Пройденных» — нет.
const learnSearchCourses = [
  learnCourse,
  Course(
    id: 8,
    title: 'Амоксиклав',
    description: 'x',
    lessonCount: 2,
    progress: .4,
    ownerBrand: 'Sandoz',
  ),
  Course(
    id: 9,
    title: 'Нурофен',
    description: 'x',
    lessonCount: 2,
    progress: 1,
    ownerBrand: 'Reckitt',
  ),
];

const learnQuiz = Quiz(
  title: 'Тест',
  passScore: 4,
  questions: [
    QuizQuestion(
      id: 1,
      type: QuizQuestionType.single,
      text: 'Доритрицин применяется при лечении:',
      options: [
        'Инфекций верхних дыхательных путей',
        'Желудочно-кишечных расстройств',
        'Кожных заболеваний',
        'Сердечно-сосудистых патологий',
      ],
    ),
    QuizQuestion(
      id: 2,
      type: QuizQuestionType.single,
      text: '2',
      options: ['a', 'b'],
    ),
    QuizQuestion(
      id: 3,
      type: QuizQuestionType.single,
      text: '3',
      options: ['a', 'b'],
    ),
    QuizQuestion(
      id: 4,
      type: QuizQuestionType.single,
      text: '4',
      options: ['a', 'b'],
    ),
    QuizQuestion(
      id: 5,
      type: QuizQuestionType.single,
      text: '5',
      options: ['a', 'b'],
    ),
  ],
);
