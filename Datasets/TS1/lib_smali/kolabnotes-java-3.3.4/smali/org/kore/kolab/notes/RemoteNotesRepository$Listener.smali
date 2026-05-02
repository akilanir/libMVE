.class public interface abstract Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;
.super Ljava/lang/Object;
.source "RemoteNotesRepository.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/kore/kolab/notes/RemoteNotesRepository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Listener"
.end annotation


# virtual methods
.method public abstract onFolderSyncException(Ljava/lang/String;Ljava/lang/Exception;)V
.end method

.method public abstract onSyncUpdate(Ljava/lang/String;)V
.end method
