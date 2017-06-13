(eval-after-load "sql"
  '(load-library "sql-indent"))

(setq sql-indent-first-column-regexp
      (concat "\\(^\\s-*\\(" (regexp-opt '(
                                           "select" "update" "insert" "delete"
                                           "union" "intersect"
                                           "from" "where" "into" "group" "having" "order"
                                           "set"
                                           "create" "drop" "truncate")
                                         'symbols) "\\|--\\)\\(\\b\\|\\s-\\)\\)\\|\\(^```$\\)"))
