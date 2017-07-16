;;; karel-mode.el --- major mode for the Karel lang.

;; Copyright © 2016, by anton.feldmann@daimler.com

;; Author: Anton Feldmann ( Anton.Feldmann@daimler.com )
;; Version: 0.0.1
;; Created: 02 Jun 2016

;; This file is not part of GNU Emacs.

;;; License:

;; The MIT License (MIT)
;; Copyright (c) 2016 <Anton Feldmann>

;; Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;;; Commentary:

;; short description here

;; full doc on how to use here

;;; Code:

;; Identifiers;

;; define keywords
(setq karel-procedure '("ABORT_TASK" "ACT_SCREEN" "ACT_TBL" "ADD_BYNAMEPC" "ADD_DICT" "ADD_INTPC" "ADD_REALPC" "ADD_STRINGPC" "APPEND_NODE" "APPEND_QUEUE" "ATT_WINDOW_D" "ATT_WINDOW_S" "AVL_POS_NUM" "BYTES_AHEAD" "CALL_PROG" "CALL_PROGLIN CHECK_DICT" "CHECK_EPOS" "CHECK_NAME" "CLEAR" "CLEAR_SEMA" "CLOSE_TEP" "CLR_IO_STAT" "CLR_PORT_SIM" "CLR_POS_REG" "CNC_DYN_DISB" "CNC_DYN_DISE CNC_DYN_DISI" "CNC_DYN_DISP" "CNC_DYN_DISR CNC_DYN_DISS" "CNCL_STP_MTN" "CNV_CNF_STRG" "CNV_CONF_STR" "CNV_INT_STR" "CNV_JPOS_REL" "CNV_REAL_STR" "CNV_REL_JPOS" "CNV_STR_CONF" "CNV_STR_INT" "CNV_STR_REAL" "CNV_STR_TIME" "CNV_TIME_STR" "COMPARE_FILE" "CONT_TASK" "COPY_FILE" "COPY_PATH" "COPY_QUEUE" "COPY_TPE" "CREATE_TPE" "CREATE_VAR" "DAQ_CHECKP" "DAQ_REGPIPE" "DAQ_START" "DAQ_STOP" "DAQ_UNREG" "DAQ_WRITE" "DEF_SCREEN" "DEF_WINDOW" "DELETE_FILE" "DELETE_NODE" "DELETE_QUEUE" "DEL_INST_TPE" "DET_WINDOW" "DISCTRL_ALPH" "DISCTRL_FORM" "DISCTRL_LIST" "DISCTRL_PLMN" "DISCTRL_SBMN" "DISCTRL_TBL" "DISMOUNT_DEV" "DOSFILE_INF" "ERR_DATA" "FILE_LIST" "FORCE_SPMENU" "FORMAT_DEV" "GET_ATTR_PRG" "GET_PORT_ASG" "GET_PORT_CMT" "GET_PORT_MOD" "GET_PORT_SIM" "GET_PORT_VAL" "GET_POS_FRM" "GET_POS_TYP" "GET_PREG_CMT" "GET_QUEUE" "GET_REG" "GET_REG_CMT" "GET_SREG_CMT" "GET_STR_REG" "GET_TIME" "GET_TPE_CMT" "GET_TPE_PRM" "GET_TSK_INFO" "GET_USEC_SUB" "GET_VAR" "INI_DYN_DISB" "INI_DYN_DISE" "INI_DYN_DISI" "INI_DYN_DISP" "INI_DYN_DISR" "INI_DYN_DISS" "INIT_QUEUE" "INIT_TBL" "INSERT_NODE" "INSERT_QUEUE" "IO_MOD_TYPE" "KCL" "KCL_NO_WAIT" "KCL_STATUS" "LOAD" "LOAD_STATUS" "LOCK_GROUP" "MODIFY_QUEUE" "MOUNT_DEV" "MOVE_FILE" "MSG_CONNECT" "MSG_DISO" "MSG_PING" "OPEN_TPE" "PAUSE_TASK" "PEND_SEMA" "PIPE_CONFIG" "POP_KEY_RD" "POS_REG_TYPE" "POST_ERR" "POST_ERR_L" "POST_SEMA" "PRINT_FILE" "PROG_BACKUP" "PROG_CLEAR" "PROG_RESTORE" "PROG_LIST" "PURGE_DEV" "PUSH_KEY_RD" "READ_DICT" "READ_DICT_V" "READ_KB" "REMOVE_DICT" "RENAME_FILE" "RENAME_VAR" "RENAME_VARS" "RESET RUN_TASK" "SAVE" "SAVE_DRAM" "SELECT_TPE" "SEND_DATAPC" "SEND_EVENTPC" "SET_ATTR_PRG" "SET_CURSOR" "SET_EPOS_REG" "SET_EPOS_TPE" "SET_FILE_ATR" "SET_FILE_POS" "SET_INT_REG" "SET_JPOS_REG" "SET_JPOS_TPE" "SET_LANG" "SET_PERCH" "SET_PORT_ASG" "SET_PORT_ATR" "SET_PORT_CMT" "SET_PORT_MOD" "SET_PORT_SIM" "SET_PORT_VAL" "SET_POS_REG" "SET_POS_TPE" "SET_PREG_CMT" "SET_REAL_REG" "SET_REG" "CMT" "SET_SREG_CMT" "SET_STR_REG" "SET_TIME" "SET_TPE_CMT" "SET_TRNS_TPE" "SET_TSK_ATTR" "SET_TSK_NAME" "SET_VAR" "TRANSLATE" "UNLOCK_GROUP" "UNPOS" "V_CAM_CALIB" "V_GET_OFFSET" "V_GET_PASSFL" "V_GET_QUEUE" "V_INIT_QUEUE" "V_RALC_QUEUE" "V_RUN_FIND" "V_SET_REF" "V_START_VTRK" "V_STOP_VTRK" "VAR_INFO" "VAR_LIST" "VOL_SPACE" "VREG_FND_POS VREG_OFFSET" "WRITE_DICT" "WRITE_DICT_V" "XML_ADDTAG" "XML_GETDATA" "XML_REMTAG" "XML_SCAN" "XML_SETVAR") )
(setq karel-constant '("CR" "'" "true" "false") )
(setq karel-comments '("--" "$"))
(setq karel-operator '("AND" "OR" "NOT" "DIV" "MOD" "<=" ">=" "<" ">" "<>" ">=<" "+" "=" "*" "\\" "/" ":" "#" "@"))
(setq karel-types '("ARRAY" "BOOLEAN" "BYTE" "CONFIG" "DISP_DAT_T" "FILE" "INTEGER" "JOINTPOS" "PATH" "QUEUE_TYPE" "REAL" "SHORT" "STD_PTH_NODE" "STRING" "VECTOR" "XYZWPR" "XYZWPREXT"))
(setq karel-structure '( "STRUCTURE" "ENDSTRUCTURE"))
(setq karel-action '("NOABORT" "NOMESSAGE" "NOPAUSE" "PULSE" "RESUME" "STOP" "UNHOLD" "UNPAUSE"))
(setq karel-signal '("SIGNAL EVENT" "SIGNAL SEMAPHORE"))
(setq karel-functions '("ABS" "ACOS" "APPROACH" "ARRAY_LEN" "ASIN" "ATAN2" "ATTACH" "BYNAME" "BYTES_LEFT" "CHR" "COS" "CURJPOS" "CURPOS" "CURR_PROG" "EXP" "FRAME" "GET_FILE_POS" "GET_JPOS_REG" "GET_JPOS_TPE" "GET_PORT_ATR" "GET_POS_REG" "GET_POS_TPE" "GET_USEC_TIM" "INDEX" "IN_RANGE" "INV" "IO_STATUS" "J_IN_RANGE" "JOINT2POS" "LN" "MIRROR" "MOTION_CTL" "NODE_SIZE" "ORD" "ORIENT" "PATH_LEN" "POS" "POS2JOINT" "ROUND" "SEMA_COUNT" "SIN" "SQRT" "STR_LEN" "SUB_STR" "TAN" "TRUNC" "UNINIT") )
(setq karel-clause '("EVAL" "FROM" "IN" "WHEN" "WITH") )
(setq karel-condition '("IF" "THEN" "ELSE" "ENDIF" "SELECT" "ENDSELECT"))
(setq karel-loop '("WHILE" "DO" "ENDWHILE" "FOR") )
(setq karel-statement '("ABORT" "CONDITION" "ENDCONDITION" "CONTINUE" "DELAY" "ERROR" "EVENT" "FOR" "ENDFOR" "HOLD" "READ" "RELEASE" "REPEAT" "RETURN" "SEMAPHORE" "UNTIL" "USING" "ENDUSING" "WRITE" "CANCEL FILE" "CLOSE FILE" "CLOSE HAND" "CONNECT TIMER" "DISABLE CONDITION" "DISCONNECT TIMER" "ENABLE CONDITION" "GO TO" "OPEN FILE" "OPEN HAND" "PURE CONDITION" "RELAX HAND" "WAIT FOR"))
(setq karel-keywords '("BEGIN" "CONST" "END" "PROGRAM" "ROUTINE" "STRUCT" "TYPE" "VAR"))

;; generate regex string for each category of keywords
(setq karel-procedure-regex (regexp-opt karel-procedure 'words))
(setq karel-constant-regexp (regexp-opt karel-constant 'words))
(setq karel-comments-regexp (regexp-opt karel-comments 'words))
(setq karel-operator-regexp (regexp-opt karel-operator 'words))
(setq karel-types-regexp (regexp-opt karel-types 'words))
(setq karel-structure-regexp (regexp-opt karel-structure 'words))
(setq karel-action-regexp (regexp-opt karel-action 'words))
(setq karel-signal-regexp (regexp-opt karel-signal 'words))
(setq karel-functions-regexp (regexp-opt karel-functions 'words))
(setq karel-clause-regexp (regexp-opt karel-clause 'words))
(setq karel-condition-regexp (regexp-opt karel-condition 'words))
(setq karel-loop-regexp (regexp-opt karel-loop 'words))
(setq karel-statement-regexp (regexp-opt karel-statement 'words))
(setq karel-keywords-regexp (regexp-opt karel-keywords 'words))

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq karel-font-lock-keywords
      `(
        (,karel-procedure-regex . font-lock-function-name-face)
	(,karel-constant-regexp . font-lock-constant-face)
	(,karel-comments-regexp . font-lock-comment-face)
	(,karel-operator-regexp . font-lock-preprocessor-face)
	(,karel-types-regexp . font-lock-type-face)
	(,karel-structure-regexp . font-lock-function-name-face)
	(,karel-action-regexp . font-lock-function-name-face)
	(,karel-signal-regexp . font-lock-function-name-face)
	(,karel-functions-regexp . font-lock-function-name-face)
	(,karel-clause-regexp . font-lock-variable-name-face)
	(,karel-condition-regexp . font-lock-warning-face)
	(,karel-loop-regexp . font-lock-constant-face)
	(,karel-statement-regexp . font-lock-string-face)
	(,karel-keywords-regexp . font-lock-keyword-face)
        ;; note: order above matters, because once colored, that part won't change.
        ;; in general, longer words first
        ))

;;;###autoload
(define-derived-mode karel-mode fundamental-mode
  "kl mode"
  "Major mode for editing kl (Karel Programming Language)…"

  ;; code for syntax highlighting
  (setq font-lock-defaults '((karel-font-lock-keywords))))


(add-to-list 'auto-mode-alist '("\\.kl\\'" . karel-mode))

;; clear memory. no longer needed
(setq karel-procedure nil)
(setq karel-constant nil)
(setq karel-comment nil)
(setq karel-operator nil)
(setq karel-types nil)
(setq karel-structure nil)
(setq karel-action nil)
(setq karel-signal nil)
(setq karel-functions nil)
(setq karel-clause nil)
(setq karel-condition nil)
(setq karel-loop nil)
(setq karel-statement nil)
(setq karel-keywords nil)

;; clear memory. no longer needed
(setq karel-procedure-regexp nil)
(setq karel-constant-regexp nil)
(setq karel-comment-regexp nil)
(setq karel-operator-regexp nil)
(setq karel-types-regexp nil)
(setq karel-structure-regexp nil)
(setq karel-action-regexp nil)
(setq karel-signal-regexp nil)
(setq karel-functions-regexp nil)
(setq karel-clause-regexp nil)
(setq karel-condition-regexp nil)
(setq karel-loop-regexp nil)
(setq karel-statement-regexp nil)
(setq karel-keywords-regexp nil)

;; add the mode to the `features' list
(provide 'karel-mode)

;; Local Variables:
;; coding: utf-8
;; End:

;;; karel-mode.el ends here
