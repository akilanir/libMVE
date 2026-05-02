.class public Lcom/jcraft/jsch/ChannelSftp$LsEntry;
.super Ljava/lang/Object;
.source "ChannelSftp.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jcraft/jsch/ChannelSftp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LsEntry"
.end annotation


# instance fields
.field private attrs:Lcom/jcraft/jsch/SftpATTRS;

.field private filename:Ljava/lang/String;

.field private longname:Ljava/lang/String;

.field final synthetic this$0:Lcom/jcraft/jsch/ChannelSftp;


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/ChannelSftp;Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    .registers 5
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "longname"    # Ljava/lang/String;
    .param p4, "attrs"    # Lcom/jcraft/jsch/SftpATTRS;

    .prologue
    .line 2987
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2988
    invoke-virtual {p0, p2}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->setFilename(Ljava/lang/String;)V

    .line 2989
    invoke-virtual {p0, p3}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->setLongname(Ljava/lang/String;)V

    .line 2990
    invoke-virtual {p0, p4}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->setAttrs(Lcom/jcraft/jsch/SftpATTRS;)V

    .line 2991
    return-void
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassCastException;
        }
    .end annotation

    .prologue
    .line 3000
    instance-of v0, p1, Lcom/jcraft/jsch/ChannelSftp$LsEntry;

    if-eqz v0, :cond_11

    .line 3001
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->filename:Ljava/lang/String;

    check-cast p1, Lcom/jcraft/jsch/ChannelSftp$LsEntry;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getFilename()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 3003
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_11
    new-instance v0, Ljava/lang/ClassCastException;

    const-string v1, "a decendent of LsEntry must be given."

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAttrs()Lcom/jcraft/jsch/SftpATTRS;
    .registers 2

    .prologue
    .line 2996
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    return-object v0
.end method

.method public getFilename()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2992
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->filename:Ljava/lang/String;

    return-object v0
.end method

.method public getLongname()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2994
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->longname:Ljava/lang/String;

    return-object v0
.end method

.method setAttrs(Lcom/jcraft/jsch/SftpATTRS;)V
    .registers 2
    .param p1, "attrs"    # Lcom/jcraft/jsch/SftpATTRS;

    .prologue
    .line 2997
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    return-void
.end method

.method setFilename(Ljava/lang/String;)V
    .registers 2
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 2993
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->filename:Ljava/lang/String;

    return-void
.end method

.method setLongname(Ljava/lang/String;)V
    .registers 2
    .param p1, "longname"    # Ljava/lang/String;

    .prologue
    .line 2995
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->longname:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2998
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->longname:Ljava/lang/String;

    return-object v0
.end method
