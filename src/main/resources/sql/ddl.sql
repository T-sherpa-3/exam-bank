DROP TABLE IF EXISTS `tb_exam`;

CREATE TABLE `tb_exam` (
                           `seq`	bigint auto_increment primary key	NOT NULL	COMMENT '시험지 sequence number',
                           `user_seq`	bigint	NOT NULL	COMMENT '회원 sequence number',
                           `name`	varchar(200)	NOT NULL	COMMENT '시험지 명',
                           `subject_name`	varchar(30)	NULL,
                           `item_cnt`	int	NULL	DEFAULT 0	COMMENT '시험지 내 문제 수',
                           `reg_date`	timestamp	NULL	DEFAULT now()	COMMENT '시험지 생성 일시',
                           `update_date`	timestamp	NULL	COMMENT '시험지명, 문항 수정일시',
                           `delete_flag`	tinyint	NULL	DEFAULT 0	COMMENT '0:유지, 1:삭제',
                           `setting_subject`	int	NULL	DEFAULT 0	COMMENT '단원 ID+ 순서(코드), 셋팅지가 아닌 경우0'
);

DROP TABLE IF EXISTS `tb_exam_item`;

CREATE TABLE `tb_exam_item` (
                                `seq`	bigint auto_increment primary key	NOT NULL	COMMENT '시험지문항 sequence number',
                                `exam_seq`	bigint	NOT NULL	COMMENT '시험지 sequence number',
                                `item_no`	int	NOT NULL	COMMENT '시험지 내 문항 순서',
                                `item_id`	bigint	NOT NULL	COMMENT '문항API 고유 ID',
                                `delete_flag`	tinyint	NULL	DEFAULT 0	COMMENT '0:유지, 1:삭제'
);

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
                           `seq`	bigint auto_increment primary key	NOT NULL	COMMENT '회원 sequence number',
                           `user_id`	varchar(50)	NOT NULL	COMMENT '로그인계정ID',
                           `password`	varchar(50)	NOT NULL	COMMENT '로그인계정PW',
                           `name`	varchar(50)	NOT NULL	COMMENT '회원 이름'
);

DROP TABLE IF EXISTS `tb_item_error`;

CREATE TABLE `tb_item_error` (
                                 `seq`	bigint auto_increment primary key	NOT NULL	COMMENT '오류 sequence number',
                                 `user_seq`	bigint	NOT NULL	COMMENT '문항 오류 신고한 회원 sequence number',
                                 `report_date`	timestamp	NOT NULL	DEFAULT now()	COMMENT '오류 신고 발생 일시',
                                 `item_id`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `tb_exam_file`;

CREATE TABLE `tb_exam_file` (
                                `seq`	bigint auto_increment primary key	NOT NULL	COMMENT '시험지 sequence number',
                                `exam_seq`	bigint	NOT NULL	COMMENT '시험지 sequence number',
                                `name`	varchar(50)	NOT NULL	COMMENT 'UUID',
                                `type`	varchar(2)	NULL	COMMENT '전체A, 문제Q, 해설+정답E,문항정보표C',
                                `extension`	varchar(10)	NULL	COMMENT 'pdf, html',
                                `path`	varchar(200)	NULL	COMMENT '디렉터리(유형)+파일명(uuid)+확장자'
);

ALTER TABLE `tb_exam` ADD CONSTRAINT `FK_tb_user_TO_tb_exam_1` FOREIGN KEY (
                                                                            `user_seq`
    )
    REFERENCES `tb_user` (
                          `seq`
        );

ALTER TABLE `tb_exam_item` ADD CONSTRAINT `FK_tb_exam_TO_tb_exam_item_1` FOREIGN KEY (
                                                                                      `exam_seq`
    )
    REFERENCES `tb_exam` (
                          `seq`
        );

ALTER TABLE `tb_item_error` ADD CONSTRAINT `FK_tb_user_TO_tb_item_error_1` FOREIGN KEY (
                                                                                        `user_seq`
    )
    REFERENCES `tb_user` (
                          `seq`
        );

ALTER TABLE `tb_exam_file` ADD CONSTRAINT `FK_tb_exam_TO_tb_exam_file_1` FOREIGN KEY (
                                                                                      `exam_seq`
    )
    REFERENCES `tb_exam` (
                          `seq`
        );

ALTER TABLE tb_exam convert to charset utf8;
ALTER TABLE tb_exam_item convert to charset utf8;
ALTER TABLE tb_user convert to charset utf8;
ALTER TABLE tb_item_error convert to charset utf8;
ALTER TABLE tb_exam_file convert to charset utf8;

