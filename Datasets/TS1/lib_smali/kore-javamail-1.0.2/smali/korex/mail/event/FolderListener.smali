.class public interface abstract Lkorex/mail/event/FolderListener;
.super Ljava/lang/Object;
.source "FolderListener.java"

# interfaces
.implements Ljava/util/EventListener;


# virtual methods
.method public abstract folderCreated(Lkorex/mail/event/FolderEvent;)V
.end method

.method public abstract folderDeleted(Lkorex/mail/event/FolderEvent;)V
.end method

.method public abstract folderRenamed(Lkorex/mail/event/FolderEvent;)V
.end method
