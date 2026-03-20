(defun uva-tool--hunt (username num)
  "hunt for recent summit for specified username"
  (async-shell-command (format "uva-tool -hunt -u %s -r %s" username num)))

(defun uva-tool--submit (id file-name lang)
  "Submit problem with uva-tool"
  (async-shell-command (format "uva-tool -submit %s %s %s"
                               id file-name lang)))
