window.krypt = {}

window.krypt =
  status: ->
    return """
    ## #{state.activeRealm}...origin/#{state.originRealm}
    """

state =
  activeRealm: "earthrealm"
  originRealm: "outworld"

text =
  welcome: "Welcome to Krypt!"
  help: """

  usage:     krypt.<command>(<args>)
  example:   krypt.add(liu-kang.warrior)

  commands:

  add        Add new or modified entities to the staging area
  rm         Remove entities from the working dimension and staging area
  reset      Reset changes made to the staging area

  status     Show the status of the working dimension and staging area
  commit     Record changes to the repository
  log        Show the commit history log

  realm      List, create, or delete realms
  checkout   Switch the active realm to another realm
  merge      Join two realms together

  clone      Clone a remote repository into working dimension
  pull       Receive changes from a remote repository
  push       Send changes to a remote repository
  """
  prompt: "raiden@tgod:~$"

# Print welcome message
window.jqconsole =
  $("#console").jqconsole("#{text.welcome}\n #{text.help}\n\n", "#{text.prompt} ")

# Abort prompt on ctrl-z
jqconsole.RegisterShortcut "Z", ->
  jqconsole.AbortPrompt()
  handler()
  return

# Move to line start ctrl-a
jqconsole.RegisterShortcut "A", ->
  jqconsole.MoveToStart()
  handler()
  return

# Move to line end ctrl-e
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
      jqconsole.Write window.eval(command) + "\n"
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
