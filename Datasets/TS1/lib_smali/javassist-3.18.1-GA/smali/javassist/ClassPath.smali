.class public interface abstract Ljavassist/ClassPath;
.super Ljava/lang/Object;
.source "ClassPath.java"


# virtual methods
.method public abstract close()V
.end method

.method public abstract find(Ljava/lang/String;)Ljava/net/URL;
.end method

.method public abstract openClassfile(Ljava/lang/String;)Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation
.end method
