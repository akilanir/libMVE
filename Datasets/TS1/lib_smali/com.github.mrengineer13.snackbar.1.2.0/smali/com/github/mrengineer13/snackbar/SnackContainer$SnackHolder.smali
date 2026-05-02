.class Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;
.super Ljava/lang/Object;
.source "SnackContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/mrengineer13/snackbar/SnackContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SnackHolder"
.end annotation


# instance fields
.field final button:Landroid/widget/TextView;

.field final messageView:Landroid/widget/TextView;

.field final snack:Lcom/github/mrengineer13/snackbar/Snack;

.field final snackView:Landroid/view/View;

.field final visListener:Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;


# direct methods
.method private constructor <init>(Lcom/github/mrengineer13/snackbar/Snack;Landroid/view/View;Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;)V
    .registers 5
    .param p1, "snack"    # Lcom/github/mrengineer13/snackbar/Snack;
    .param p2, "snackView"    # Landroid/view/View;
    .param p3, "listener"    # Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;

    .prologue
    .line 303
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 304
    iput-object p2, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snackView:Landroid/view/View;

    .line 305
    sget v0, Lcom/github/mrengineer13/snackbar/R$id;->snackButton:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->button:Landroid/widget/TextView;

    .line 306
    sget v0, Lcom/github/mrengineer13/snackbar/R$id;->snackMessage:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->messageView:Landroid/widget/TextView;

    .line 308
    iput-object p1, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    .line 309
    iput-object p3, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->visListener:Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;

    .line 310
    return-void
.end method

.method synthetic constructor <init>(Lcom/github/mrengineer13/snackbar/Snack;Landroid/view/View;Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;Lcom/github/mrengineer13/snackbar/SnackContainer$1;)V
    .registers 5
    .param p1, "x0"    # Lcom/github/mrengineer13/snackbar/Snack;
    .param p2, "x1"    # Landroid/view/View;
    .param p3, "x2"    # Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;
    .param p4, "x3"    # Lcom/github/mrengineer13/snackbar/SnackContainer$1;

    .prologue
    .line 295
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;-><init>(Lcom/github/mrengineer13/snackbar/Snack;Landroid/view/View;Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;)V

    return-void
.end method
