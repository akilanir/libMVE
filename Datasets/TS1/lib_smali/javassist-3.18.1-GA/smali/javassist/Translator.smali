.class public interface abstract Ljavassist/Translator;
.super Ljava/lang/Object;
.source "Translator.java"


# virtual methods
.method public abstract onLoad(Ljavassist/ClassPool;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;,
            Ljavassist/CannotCompileException;
        }
    .end annotation
.end method

.method public abstract start(Ljavassist/ClassPool;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;,
            Ljavassist/CannotCompileException;
        }
    .end annotation
.end method
