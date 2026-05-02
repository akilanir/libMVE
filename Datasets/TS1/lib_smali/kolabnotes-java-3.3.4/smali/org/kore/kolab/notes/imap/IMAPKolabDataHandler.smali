.class public Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler;
.super Lkorex/activation/DataHandler;
.source "IMAPKolabDataHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler$NoCloseOutputStream;
    }
.end annotation


# static fields
.field private static final myDF:Lkorex/activation/ActivationDataFlavor;


# instance fields
.field private final parser:Lorg/kore/kolab/notes/KolabParser;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 35
    new-instance v0, Lkorex/activation/ActivationDataFlavor;

    const-class v1, Lorg/kore/kolab/notes/Note;

    const-string v2, "APPLICATION/VND.KOLAB+XML"

    const-string v3, "Kolab Object"

    invoke-direct {v0, v1, v2, v3}, Lkorex/activation/ActivationDataFlavor;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler;->myDF:Lkorex/activation/ActivationDataFlavor;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;Lorg/kore/kolab/notes/KolabParser;)V
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "parser"    # Lorg/kore/kolab/notes/KolabParser;

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Lkorex/activation/DataHandler;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    iput-object p3, p0, Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler;->parser:Lorg/kore/kolab/notes/KolabParser;

    .line 60
    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 93
    const-string v0, "APPLICATION/VND.KOLAB+XML"

    return-object v0
.end method

.method public getTransferData(Lkore/awt/datatransfer/DataFlavor;)Ljava/lang/Object;
    .registers 3
    .param p1, "flavor"    # Lkore/awt/datatransfer/DataFlavor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkore/awt/datatransfer/UnsupportedFlavorException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-virtual {p0, p1}, Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler;->isDataFlavorSupported(Lkore/awt/datatransfer/DataFlavor;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 75
    invoke-virtual {p0}, Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler;->getContent()Ljava/lang/Object;

    move-result-object v0

    .line 77
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;
    .registers 4

    .prologue
    .line 69
    const/4 v0, 0x1

    new-array v0, v0, [Lkore/awt/datatransfer/DataFlavor;

    const/4 v1, 0x0

    sget-object v2, Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler;->myDF:Lkorex/activation/ActivationDataFlavor;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public isDataFlavorSupported(Lkore/awt/datatransfer/DataFlavor;)Z
    .registers 3
    .param p1, "flavor"    # Lkore/awt/datatransfer/DataFlavor;

    .prologue
    .line 83
    sget-object v0, Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler;->myDF:Lkorex/activation/ActivationDataFlavor;

    invoke-virtual {v0, p1}, Lkorex/activation/ActivationDataFlavor;->equals(Lkore/awt/datatransfer/DataFlavor;)Z

    move-result v0

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler;->parser:Lorg/kore/kolab/notes/KolabParser;

    invoke-virtual {p0}, Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler;->getContent()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/kore/kolab/notes/KolabParser;->write(Ljava/lang/Object;Ljava/io/OutputStream;)V

    .line 89
    return-void
.end method
