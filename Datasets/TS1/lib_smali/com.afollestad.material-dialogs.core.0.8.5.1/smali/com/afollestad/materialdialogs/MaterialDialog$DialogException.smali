.class public Lcom/afollestad/materialdialogs/MaterialDialog$DialogException;
.super Landroid/view/WindowManager$BadTokenException;
.source "MaterialDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/afollestad/materialdialogs/MaterialDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DialogException"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 248
    invoke-direct {p0, p1}, Landroid/view/WindowManager$BadTokenException;-><init>(Ljava/lang/String;)V

    .line 249
    return-void
.end method
