.class public Lkore/awt/datatransfer/UnsupportedFlavorException;
.super Ljava/lang/Exception;
.source "UnsupportedFlavorException.java"


# static fields
.field private static final serialVersionUID:J = 0x4ab7272ac88f5cc1L


# direct methods
.method public constructor <init>(Lkore/awt/datatransfer/DataFlavor;)V
    .registers 3
    .param p1, "flavor"    # Lkore/awt/datatransfer/DataFlavor;

    .prologue
    .line 51
    if-eqz p1, :cond_a

    invoke-virtual {p1}, Lkore/awt/datatransfer/DataFlavor;->getHumanPresentableName()Ljava/lang/String;

    move-result-object v0

    :goto_6
    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 52
    return-void

    .line 51
    :cond_a
    const/4 v0, 0x0

    goto :goto_6
.end method
