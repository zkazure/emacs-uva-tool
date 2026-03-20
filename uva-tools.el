(defgroup uva-tool nil
  "uva-tool client"
  :prefix 'uva-tool-
  :group 'tools)

(defcustom uva-tool-username 'default
  "Your username in UVA"
  :group 'uva-tool
  :type 'string)

(defcustom uva-tool-language 5
  "Programming language for solving UVA problems.
Codes: 1 ANSI, 2 JAVA, 3 C++, 4 Pascal, 5 C++11, 6 Python."
  :group 'uva-tool
  :type '(choice
          (const :tag "1 (ANSI)" 1)
          (const :tag "2 (JAVA)" 2)
          (const :tag "3 (C++)" 3)
          (const :tag "4 (Pascal)" 4)
          (const :tag "5 (C++11)" 5)
          (const :tag "6 (Python)" 6))
  :validate (lambda (v)
              (unless (member v '(1 2 3 4 5 6))
                (error "uva-tool-language must be one of: 1..6"))))

(defun uva-tool--hunt (username num)
  "Fetch recent submits for username with uva-tool."
  (async-shell-command (format "uva-tool -hunt -u %s -r %s" username num)))

(defun uva-tool--submit (id file-name lang)
  "Submit a problem to UVA with uva-tool"
  (async-shell-command (format "uva-tool -submit %s %s %s"
                               id file-name lang)))

;;;###autoload
(defun uva-tool-hunt-myself ()
  "Fetch recent submits for yourself with uva-tool"
  (interactive)
  (uva-tool--hunt uva-tool-username 10))

