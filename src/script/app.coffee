$ ->

  # Creating the console.
  header = "Welcome to JQConsole!\n" + "Use jqconsole.Write() to write and " \
    + "jqconsole.Input() to read.\n"
  window.jqconsole = $("#console").jqconsole(header, "JS> ")

  # Abort prompt on Ctrl+Z.
  jqconsole.RegisterShortcut "Z", ->
    jqconsole.AbortPrompt()
    handler()
    return


  # Move to line start Ctrl+A.
  jqconsole.RegisterShortcut "A", ->
    jqconsole.MoveToStart()
    handler()
    return


  # Move to line end Ctrl+E.
  jqconsole.RegisterShortcut "E", ->
    jqconsole.MoveToEnd()
    handler()
    return

  jqconsole.RegisterMatching "{", "}", "brace"
  jqconsole.RegisterMatching "(", ")", "paran"
  jqconsole.RegisterMatching "[", "]", "bracket"

  # Handle a command.
  handler = (command) ->
    if command
      try
        jqconsole.Write "==> " + window.eval(command) + "\n"
      catch e
        jqconsole.Write "ERROR: " + e.message + "\n"
    jqconsole.Prompt true, handler, (command) ->

      # Continue line if can't compile the command.
      try
        Function command
      catch e
        if /[\[\{\(]$/.test(command)
          return 1
        else
          return 0
      false

    return


  # Initiate the first prompt.
  handler()
  return
