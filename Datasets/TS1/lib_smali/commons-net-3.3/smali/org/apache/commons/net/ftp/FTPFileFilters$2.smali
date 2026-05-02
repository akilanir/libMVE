.class final Lorg/apache/commons/net/ftp/FTPFileFilters$2;
.super Ljava/lang/Object;
.source "FTPFileFilters.java"

# interfaces
.implements Lorg/apache/commons/net/ftp/FTPFileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/net/ftp/FTPFileFilters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lorg/apache/commons/net/ftp/FTPFile;)Z
    .registers 3
    .param p1, "file"    # Lorg/apache/commons/net/ftp/FTPFile;

    .prologue
    .line 43
    if-eqz p1, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method
