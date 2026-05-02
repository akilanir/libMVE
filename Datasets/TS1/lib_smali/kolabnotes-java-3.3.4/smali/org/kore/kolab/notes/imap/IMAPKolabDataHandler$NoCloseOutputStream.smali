.class Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler$NoCloseOutputStream;
.super Ljava/io/FilterOutputStream;
.source "IMAPKolabDataHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NoCloseOutputStream"
.end annotation


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 47
    return-void
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 52
    return-void
.end method
