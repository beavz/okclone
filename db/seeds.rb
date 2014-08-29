User.create!([
  {session_token: "Q85EMG+xbegv26/KhupxEA==", password_digest: "$2a$10$n0kmJrOCIeNgwTIH7eGLsuADDSipHuDNFhlEf1xdgP9yrixMwxFMW", username: "Titania", email: "fairy@queen.com", age: 1590, zip_code: 12345, gender: nil, orientation: nil, ethnicity: nil, height: nil, body_type: nil, diet: nil, smokes: nil, drinks: nil, drugs: nil, religion: nil, sign: nil, education: nil, job: nil, income: nil, relationship_status: nil, relationship_type: nil, offspring: nil, pets: nil, min_age: nil, max_age: nil, looking_for_status: nil, is_looking_for_men: nil, is_looking_for_women: nil, is_looking_for_friends: nil, is_looking_for_ltdating: nil, is_looking_for_stdating: nil, is_looking_for_sexitimes: nil, essay1: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", essay2: "alsfjaosdfoasiudfoasjdflasjf asldfjasldfjosaidflaksjdf adfjao", essay3: nil, essay4: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", essay5: nil, essay6: nil, essay7: nil, essay8: nil},
  {session_token: "87AroAPDyDgVdSBPegxzFw==", password_digest: "$2a$10$Q2KsaG4ZB8LXEnV/biyDIeK5QnUgUX9W2LVnLzhTT7KddY2C/5C.C", username: "Bottom", email: "assface@mechanics.com", age: 30, zip_code: 12310, gender: nil, orientation: nil, ethnicity: nil, height: nil, body_type: nil, diet: nil, smokes: nil, drinks: nil, drugs: nil, religion: nil, sign: nil, education: nil, job: nil, income: nil, relationship_status: nil, relationship_type: nil, offspring: nil, pets: nil, min_age: nil, max_age: nil, looking_for_status: nil, is_looking_for_men: nil, is_looking_for_women: nil, is_looking_for_friends: nil, is_looking_for_ltdating: nil, is_looking_for_stdating: nil, is_looking_for_sexitimes: nil, essay1: nil, essay2: "alsfjaosdfoasiudfoasjdflasjf asldfjasldfjosaidflaksjdf adfjao", essay3: nil, essay4: nil, essay5: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", essay6: nil, essay7: nil, essay8: nil},
  {session_token: "FnrM511gdYvMdVH8GSXwpA==", password_digest: "$2a$10$42.91e0iB37eaYwbwuFjE.uV399lpoV/aPy6ZDfPT5JMpVdNW9Rbi", username: "Juliet", email: "j.capulet@twohouses.com", age: 14, zip_code: 0, gender: 1, orientation: 3, ethnicity: 6, height: nil, body_type: 4, diet: 5, smokes: 3, drinks: 4, drugs: 1, religion: 7, sign: 11, education: 8, job: 1, income: 1, relationship_status: 2, relationship_type: 3, offspring: 2, pets: 4, min_age: nil, max_age: nil, looking_for_status: 1, is_looking_for_men: nil, is_looking_for_women: nil, is_looking_for_friends: nil, is_looking_for_ltdating: nil, is_looking_for_stdating: nil, is_looking_for_sexitimes: nil, essay1: "stuff and things and other stuff", essay2: "alsfjaosdfoasiudfoasjdflasjf asldfjasldfjosaidflaksjdf adfjao", essay3: nil, essay4: nil, essay5: nil, essay6: nil, essay7: nil, essay8: nil},
  {session_token: "1MiERQejnU0STU88HwpOvg==", password_digest: "$2a$10$R.231iYymmuSqe9XlgZG..VS5IWQG7lj7szdGN2KA0A3qyMkPXdKC", username: "Romeo", email: "r.montague@twohouses.com", age: 18, zip_code: 0, gender: 2, orientation: 3, ethnicity: 6, height: nil, body_type: 4, diet: 5, smokes: 3, drinks: 4, drugs: 3, religion: 7, sign: 11, education: 8, job: 1, income: 1, relationship_status: 2, relationship_type: 3, offspring: 2, pets: 4, min_age: 10, max_age: 30, looking_for_status: 2, is_looking_for_men: nil, is_looking_for_women: nil, is_looking_for_friends: nil, is_looking_for_ltdating: nil, is_looking_for_stdating: nil, is_looking_for_sexitimes: nil, essay1: "words words words words words", essay2: nil, essay3: nil, essay4: nil, essay5: nil, essay6: nil, essay7: nil, essay8: nil}
])
Category.create!([
  {label: "nonsense"},
  {label: "super serious stuff"}
])
Question.create!([
  {text: "Wherefore art thou Romeo?", category: 1},
  {text: "What is the airspeed velocity of an unladen swallow?", category: 2},
  {text: "To be or not to be?", category: 1},
  {text: "Would you rather answer 1000 OK cupid questions, or have your facebook feed populated exclusively by that awful girl you went to highschool with?", category: 1},
  {text: "Where do stars come from?", category: 2},
  {text: "Go outside.", category: 1},
  {text: "Do you even know what wherefore means?", category: 1}
])
Answer.create!([
  {question_id: 1, text: "because that's my name"},
  {question_id: 1, text: "that's not my name"},
  {question_id: 2, text: "African or European."},
  {question_id: 2, text: "I don't know."},
  {question_id: 2, text: "Only interested in those laden w/ coconuts"},
  {question_id: 3, text: "That is the question."},
  {question_id: 3, text: "All about the slings and arrows, man."},
  {question_id: 3, text: "I like sleep."},
  {question_id: 4, text: "NOPE"},
  {question_id: 4, text: "1000 questions."},
  {question_id: 4, text: "Horrible feed."},
  {question_id: 5, text: "IDK"},
  {question_id: 5, text: "Trash fires."},
  {question_id: 6, text: "That's not a question."},
  {question_id: 6, text: "OK"},
  {question_id: 7, text: "No."},
  {question_id: 7, text: "Yes, it means 'where'."},
  {question_id: 7, text: "Yes, it means 'why'."}
])

Response.create!([
  {user_id: 1, answer_id: 1, explanation: "more words"},
  {user_id: 1, answer_id: 5, explanation: "saoodfjasdoifasdf"},
  {user_id: 1, answer_id: 7, explanation: "zzoxcvozxcivzxcv"},
  {user_id: 2, answer_id: 4, explanation: "asdzxcxzcvxzv"},
  {user_id: 2, answer_id: 10, explanation: "zxcv"},
  {user_id: 2, answer_id: 17, explanation: "asdfaszxcvaeryedfddddsd asd asdfas dfa sdfs"},
  {user_id: 3, answer_id: 2, explanation: "sfdgsdfg sfg ersdfvdfgsdwords"},
  {user_id: 3, answer_id: 14, explanation: "asdxzcv  fgsdfg fdgs dg sdfgsd fg sdfgdsfgsdfg"},
  {user_id: 3, answer_id: 13, explanation: "sdfgs dfgsdfg sdfg sdgsdf gsdfgsdfgs"},
  {user_id: 4, answer_id: 9, explanation: " sdfg dsfgsdf gsdfg sdfg sgfdsg ds"},
  {user_id: 4, answer_id: 7, explanation: "sdfgzcxvzxc srdg fghdfghdzfbsdFD  df zcvzxbx"},
  {user_id: 4, answer_id: 5, explanation: " dfv dsfgcvb czeghfgbdfghzdxdvsdadf gfdsgdsfgsd "}
])

