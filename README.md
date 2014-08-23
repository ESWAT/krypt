# Krypt (Ludum Dare 30)

Krypt is a distributed realm control system designed to handle everything from small to very large conquests with speed and efficency. Krypt was initially designed and developed by the Elder Gods to assist the victors of Mortal Kombat tournaments with merging with defeated realms.

However Shao Kahn, the Emperor of Outworld, has gained access to Krypt and the `mk.krypt` repository, giving him full control of all the realms. He now plans to use Krypt to merge his realm with Earthrealm, the most powerful realm in the comos, without participating in Mortal Kombat.

You are Raiden, the appointed protector of Earthrealm. As a deity of the Elder Gods you also have Krypt and must use it to commit the appropriate changes to `earthrealm` in the `mk.krypt` repository and delay Shao Kahn’s plan until the Elder Gods take notice and revoke Shao Kahn’s priveleges.

```
usage: krypt <command> [<args>]

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
```
