require('orgmode').setup({
  org_agenda_files = '~/Dropbox/vault/*';
  org_default_note_file = '~/Dropbox/vault/roam/notebook.org';
  org_hide_leading_stars = true;
  org_hide_emphasis_markers = true;

  org_todo_keywords = {
    ' TODO:', ' WAIT:', ' HACK:', ' NOTE:',
    '| '    , ' STOP:', ' DONE:', },
  -- mappings = {
  --   org_capture_finalize = 'C-g',
  -- },
})
