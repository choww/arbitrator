#For populating test data for db

############
#Test Users#
############
user_a = User.create(username: "CrashOverride", email: "jlm@elementary.com", password: "angie")
user_b = User.create(username: "ZeroCool", email: "jlm@trainspotting.com", password: "sickboy")
user_c = User.create(username: "CerealKiller", email: "ml@scoobysnacks.com", password: "scream")
user_d = User.create(username: "AcidBurn", email: "lara@tombs.com", password: "brad")
user_e = User.create(username: "LordNikon", email: "sammy@prisonbreak.com", password: "sammy")
user_f = User.create(username: "PhantomPhreak", email: "sallycantdance@conair.com", password: "ramon")
user_g = User.create(username: "Plague", email: "fisher@shortcircuit.com", password: "johnny5")

################
#Test Questions#
################
q_a = user_a.questions.create(category: "sports", content: "Pippen v. Jordan", time: 60, option_a: "Pippen", option_b: "Jordan")
q_b = user_a.questions.create(category: "sports", content: "Jordan v. Curry", option_a: "Jordan", option_b: "Curry")
q_c = user_b.questions.create(category: "food", content: "Tacos v. Burritos", option_a: "Taco", option_b: "Burrito")
q_d = user_b.questions.create(category: "food", content: "Chinese v. Greek", time: 90, option_a: "Chinese", option_b: "Greek")
q_e = user_c.questions.create(category: "politics", content: "Hilary v. Bernie", option_a: "Hildog", option_b: "BernPerson")
q_f = user_c.questions.create(category: "politics", content: "Rubio v. Trump", option_a: "Rubiotron", option_b: "Trumpinator")
q_g = user_d.questions.create(category: "politics", content: "The Body v. Governator", option_a: "The Body", option_b: "Governator")
q_h = user_d.questions.create(category: "sci-tech", content: "Uber v. Lyft", option_a: "Uber", option_b: "Lyft")
q_i = user_e.questions.create(category: "sci-tech", content: "Apple v. Feds", option_a: "Apple", option_b: "Feds")
q_j = user_e.questions.create(category: "sci-tech", content: "Flat Earth Theory", option_a: "Where's the curve?", option_b: "Not an idiot")
q_k = user_f.questions.create(category: "sci-tech", content: "Robots v. Wrestlers", option_a: "Robots", option_b: "Wrestlers")
q_l = user_f.questions.create(category: "pop", content: "Justin?", option_a: "Timberlake", option_b: "Bieber")
q_m = user_g.questions.create(category: "pop", content: "The dress?", option_a: "Blue/Black", option_b: "White/Gold")
q_n = user_g.questions.create(category: "pop", content: "OJ", option_a: "The glove don't fit", option_b: "He did it")
q_o = user_a.questions.create(category: "pop", content: "Kanye", option_a: "Yeezus", option_b: "Jackass")
q_p = user_a.questions.create(category: "misc", content: "Honda Accord or Mazda 3?", option_a: "Accord", option_b: "Mazda 3")
q_q = user_a.questions.create(category: "misc", content: "Pirate v. Ninja", option_a: "Pirate", option_b: "Ninja")
q_r = user_b.questions.create(category: "misc", content: "Cat v. Dog", option_a: "Cat", option_b: "Dog")
q_s = user_b.questions.create(category: "misc", content: "Boxers v. Briefs", option_a: "Boxers", option_b: "Briefs")

############
#Test Votes#
############
#No user_a
v_a = user_b.votes.create(value: 1, question_id: q_a.id)
v_b = user_c.votes.create(value: 0, question_id: q_a.id)
#No user_a
v_c = user_b.votes.create(value: 0, question_id: q_b.id)
v_d = user_e.votes.create(value: 1, question_id: q_b.id)
#No user_b
v_e = user_a.votes.create(value: 1, question_id: q_c.id)
v_f = user_e.votes.create(value: 0, question_id: q_c.id)
v_g = user_f.votes.create(value: 0, question_id: q_c.id)
v_h = user_g.votes.create(value: 0, question_id: q_c.id)
v_i = user_c.votes.create(value: 0, question_id: q_c.id)
#No user_b
v_j = user_g.votes.create(value: 1, question_id: q_d.id)
v_k = user_e.votes.create(value: 0, question_id: q_d.id)
v_l = user_a.votes.create(value: 0, question_id: q_d.id)
v_m = user_c.votes.create(value: 1, question_id: q_d.id)
#No user_c
v_n = user_e.votes.create(value: 1, question_id: q_e.id)
v_o = user_a.votes.create(value: 0, question_id: q_e.id)
v_p = user_b.votes.create(value: 1, question_id: q_e.id)
v_q = user_d.votes.create(value: 1, question_id: q_e.id)
#No user_c
v_r = user_e.votes.create(value: 1, question_id: q_f.id)
v_s = user_a.votes.create(value: 0, question_id: q_f.id)
v_t = user_b.votes.create(value: 0, question_id: q_f.id)
v_u = user_d.votes.create(value: 0, question_id: q_f.id)
v_v = user_g.votes.create(value: 0, question_id: q_f.id)
v_w = user_f.votes.create(value: 1, question_id: q_f.id)
#No user_d
v_x = user_e.votes.create(value: 1, question_id: q_g.id)
v_y = user_f.votes.create(value: 1, question_id: q_g.id)
v_z = user_g.votes.create(value: 1, question_id: q_g.id)
#No user_d
v_aa = user_e.votes.create(value: 1, question_id: q_h.id)
v_ab = user_a.votes.create(value: 1, question_id: q_h.id)
v_ac = user_b.votes.create(value: 1, question_id: q_h.id)
#No user_e
v_ad = user_a.votes.create(value: 1, question_id: q_i.id)
v_ae = user_b.votes.create(value: 1, question_id: q_i.id)
v_af = user_c.votes.create(value: 1, question_id: q_i.id)
#No user_e
v_ag = user_g.votes.create(value: 1, question_id: q_j.id)
v_ah = user_f.votes.create(value: 1, question_id: q_j.id)