.class public interface abstract Ljavassist/bytecode/ClassFileWriter$AttributeWriter;
.super Ljava/lang/Object;
.source "ClassFileWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/ClassFileWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "AttributeWriter"
.end annotation


# virtual methods
.method public abstract size()I
.end method

.method public abstract write(Ljava/io/DataOutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
