.class public interface abstract Lorg/kore/kolab/notes/RemoteNotesRepository$Base64Coder;
.super Ljava/lang/Object;
.source "RemoteNotesRepository.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/kore/kolab/notes/RemoteNotesRepository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Base64Coder"
.end annotation


# virtual methods
.method public abstract decode(Ljava/lang/String;)[B
.end method

.method public abstract encode([B)Ljava/lang/String;
.end method
