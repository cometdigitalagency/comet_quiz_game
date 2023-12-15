--
-- Class Player as table player
--

CREATE TABLE "player" (
  "id" serial,
  "username" text NOT NULL
);

ALTER TABLE ONLY "player"
  ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Class Room as table room
--

CREATE TABLE "room" (
  "id" serial,
  "name" text NOT NULL,
  "startDate" timestamp without time zone,
  "finishedDate" timestamp without time zone
);

ALTER TABLE ONLY "room"
  ADD CONSTRAINT room_pkey PRIMARY KEY (id);


--
-- Class Question as table question
--

CREATE TABLE "question" (
  "id" serial,
  "text" text NOT NULL,
  "roomId" integer NOT NULL
);

ALTER TABLE ONLY "question"
  ADD CONSTRAINT question_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "question"
  ADD CONSTRAINT question_fk_0
    FOREIGN KEY("roomId")
      REFERENCES room(id)
        ON DELETE CASCADE;

--
-- Class Answer as table answer
--

CREATE TABLE "answer" (
  "id" serial,
  "questionId" integer,
  "text" text NOT NULL,
  "isCorrectOption" boolean NOT NULL
);

ALTER TABLE ONLY "answer"
  ADD CONSTRAINT answer_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "answer"
  ADD CONSTRAINT answer_fk_0
    FOREIGN KEY("questionId")
      REFERENCES question(id)
        ON DELETE CASCADE;

--
-- Class PlayerResponse as table player_response
--

CREATE TABLE "player_response" (
  "id" serial,
  "userId" integer NOT NULL,
  "roomId" integer NOT NULL,
  "questionId" integer NOT NULL,
  "selectedAnswerId" integer NOT NULL,
  "selectedAt" integer NOT NULL
);

ALTER TABLE ONLY "player_response"
  ADD CONSTRAINT player_response_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "player_response"
  ADD CONSTRAINT player_response_fk_0
    FOREIGN KEY("userId")
      REFERENCES player(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "player_response"
  ADD CONSTRAINT player_response_fk_1
    FOREIGN KEY("roomId")
      REFERENCES room(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "player_response"
  ADD CONSTRAINT player_response_fk_2
    FOREIGN KEY("questionId")
      REFERENCES question(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "player_response"
  ADD CONSTRAINT player_response_fk_3
    FOREIGN KEY("selectedAnswerId")
      REFERENCES answer(id)
        ON DELETE CASCADE;