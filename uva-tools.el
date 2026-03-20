(defgroup uva-tool nil
  "uva-tool client"
  :prefix 'uva-tool-
  :group 'tools)

(defcustom uva-tool-username 'default
  "Your username in UVA"
  :type 'string)

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

