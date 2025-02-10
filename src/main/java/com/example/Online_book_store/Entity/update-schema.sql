CREATE TABLE user
(
    id           INT          NOT NULL,
    account_name VARCHAR(255) NOT NULL,
    password     VARCHAR(255) NULL,
    user_role    INT NULL,
    CONSTRAINT pk_user PRIMARY KEY (id)
);

ALTER TABLE user
    ADD CONSTRAINT uc_user_account_name UNIQUE (account_name);

ALTER TABLE user
    ADD CONSTRAINT uc_user_user_role UNIQUE (user_role);

ALTER TABLE user
    ADD CONSTRAINT FK_USER_ON_USER_ROLE FOREIGN KEY (user_role) REFERENCES `role` (id);