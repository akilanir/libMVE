.class public Lcom/github/mrengineer13/snackbar/SnackBar;
.super Ljava/lang/Object;
.source "SnackBar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mrengineer13/snackbar/SnackBar$2;,
        Lcom/github/mrengineer13/snackbar/SnackBar$Style;,
        Lcom/github/mrengineer13/snackbar/SnackBar$Builder;,
        Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;,
        Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;
    }
.end annotation


# static fields
.field public static final LONG_SNACK:S = 0x1388s

.field public static final MED_SNACK:S = 0xdacs

.field public static final PERMANENT_SNACK:S = 0x0s

.field public static final SHORT_SNACK:S = 0x7d0s


# instance fields
.field private final mButtonListener:Landroid/view/View$OnClickListener;

.field private mClickListener:Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;

.field private mParentView:Landroid/view/View;

.field private mSnackContainer:Lcom/github/mrengineer13/snackbar/SnackContainer;

.field private mVisibilityChangeListener:Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 7
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 375
    new-instance v2, Lcom/github/mrengineer13/snackbar/SnackBar$1;

    invoke-direct {v2, p0}, Lcom/github/mrengineer13/snackbar/SnackBar$1;-><init>(Lcom/github/mrengineer13/snackbar/SnackBar;)V

    iput-object v2, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mButtonListener:Landroid/view/View$OnClickListener;

    .line 70
    const v2, 0x1020002

    invoke-virtual {p1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 71
    .local v0, "container":Landroid/view/ViewGroup;
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    sget v3, Lcom/github/mrengineer13/snackbar/R$layout;->sb__snack:I

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 72
    .local v1, "v":Landroid/view/View;
    invoke-direct {p0, v0, v1}, Lcom/github/mrengineer13/snackbar/SnackBar;->init(Landroid/view/ViewGroup;Landroid/view/View;)V

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 375
    new-instance v2, Lcom/github/mrengineer13/snackbar/SnackBar$1;

    invoke-direct {v2, p0}, Lcom/github/mrengineer13/snackbar/SnackBar$1;-><init>(Lcom/github/mrengineer13/snackbar/SnackBar;)V

    iput-object v2, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mButtonListener:Landroid/view/View$OnClickListener;

    .line 76
    const-string v2, "layout_inflater"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 77
    .local v0, "inflater":Landroid/view/LayoutInflater;
    sget v3, Lcom/github/mrengineer13/snackbar/R$layout;->sb__snack_container:I

    move-object v2, p2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v0, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 78
    sget v3, Lcom/github/mrengineer13/snackbar/R$layout;->sb__snack:I

    move-object v2, p2

    check-cast v2, Landroid/view/ViewGroup;

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 79
    .local v1, "snackLayout":Landroid/view/View;
    check-cast p2, Landroid/view/ViewGroup;

    .end local p2    # "v":Landroid/view/View;
    invoke-direct {p0, p2, v1}, Lcom/github/mrengineer13/snackbar/SnackBar;->init(Landroid/view/ViewGroup;Landroid/view/View;)V

    .line 80
    return-void
.end method

.method static synthetic access$000(Lcom/github/mrengineer13/snackbar/SnackBar;Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;)Lcom/github/mrengineer13/snackbar/SnackBar;
    .registers 3
    .param p0, "x0"    # Lcom/github/mrengineer13/snackbar/SnackBar;
    .param p1, "x1"    # Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/github/mrengineer13/snackbar/SnackBar;->setOnClickListener(Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;)Lcom/github/mrengineer13/snackbar/SnackBar;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/github/mrengineer13/snackbar/SnackBar;Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;)Lcom/github/mrengineer13/snackbar/SnackBar;
    .registers 3
    .param p0, "x0"    # Lcom/github/mrengineer13/snackbar/SnackBar;
    .param p1, "x1"    # Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/github/mrengineer13/snackbar/SnackBar;->setOnVisibilityChangeListener(Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;)Lcom/github/mrengineer13/snackbar/SnackBar;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/github/mrengineer13/snackbar/SnackBar;Lcom/github/mrengineer13/snackbar/Snack;)V
    .registers 2
    .param p0, "x0"    # Lcom/github/mrengineer13/snackbar/SnackBar;
    .param p1, "x1"    # Lcom/github/mrengineer13/snackbar/Snack;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/github/mrengineer13/snackbar/SnackBar;->showMessage(Lcom/github/mrengineer13/snackbar/Snack;)V

    return-void
.end method

.method static synthetic access$300(Lcom/github/mrengineer13/snackbar/SnackBar;)Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/github/mrengineer13/snackbar/SnackBar;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mClickListener:Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;

    return-object v0
.end method

.method static synthetic access$400(Lcom/github/mrengineer13/snackbar/SnackBar;)Lcom/github/mrengineer13/snackbar/SnackContainer;
    .registers 2
    .param p0, "x0"    # Lcom/github/mrengineer13/snackbar/SnackBar;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mSnackContainer:Lcom/github/mrengineer13/snackbar/SnackContainer;

    return-object v0
.end method

.method private init(Landroid/view/ViewGroup;Landroid/view/View;)V
    .registers 5
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 83
    sget v1, Lcom/github/mrengineer13/snackbar/R$id;->snackContainer:I

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/github/mrengineer13/snackbar/SnackContainer;

    iput-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mSnackContainer:Lcom/github/mrengineer13/snackbar/SnackContainer;

    .line 84
    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mSnackContainer:Lcom/github/mrengineer13/snackbar/SnackContainer;

    if-nez v1, :cond_15

    .line 85
    new-instance v1, Lcom/github/mrengineer13/snackbar/SnackContainer;

    invoke-direct {v1, p1}, Lcom/github/mrengineer13/snackbar/SnackContainer;-><init>(Landroid/view/ViewGroup;)V

    iput-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mSnackContainer:Lcom/github/mrengineer13/snackbar/SnackContainer;

    .line 88
    :cond_15
    iput-object p2, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mParentView:Landroid/view/View;

    .line 89
    sget v1, Lcom/github/mrengineer13/snackbar/R$id;->snackButton:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 90
    .local v0, "snackBtn":Landroid/widget/TextView;
    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mButtonListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    return-void
.end method

.method private setOnClickListener(Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;)Lcom/github/mrengineer13/snackbar/SnackBar;
    .registers 2
    .param p1, "listener"    # Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;

    .prologue
    .line 386
    iput-object p1, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mClickListener:Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;

    .line 387
    return-object p0
.end method

.method private setOnVisibilityChangeListener(Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;)Lcom/github/mrengineer13/snackbar/SnackBar;
    .registers 2
    .param p1, "listener"    # Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;

    .prologue
    .line 391
    iput-object p1, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mVisibilityChangeListener:Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;

    .line 392
    return-object p0
.end method

.method private showMessage(Lcom/github/mrengineer13/snackbar/Snack;)V
    .registers 5
    .param p1, "message"    # Lcom/github/mrengineer13/snackbar/Snack;

    .prologue
    .line 352
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mSnackContainer:Lcom/github/mrengineer13/snackbar/SnackContainer;

    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mParentView:Landroid/view/View;

    iget-object v2, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mVisibilityChangeListener:Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;

    invoke-virtual {v0, p1, v1, v2}, Lcom/github/mrengineer13/snackbar/SnackContainer;->showSnack(Lcom/github/mrengineer13/snackbar/Snack;Landroid/view/View;Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;)V

    .line 353
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 409
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/github/mrengineer13/snackbar/SnackBar;->clear(Z)V

    .line 410
    return-void
.end method

.method public clear(Z)V
    .registers 3
    .param p1, "animate"    # Z

    .prologue
    .line 401
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mSnackContainer:Lcom/github/mrengineer13/snackbar/SnackContainer;

    invoke-virtual {v0, p1}, Lcom/github/mrengineer13/snackbar/SnackContainer;->clearSnacks(Z)V

    .line 402
    return-void
.end method

.method public getContainerView()Landroid/view/View;
    .registers 2

    .prologue
    .line 372
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mParentView:Landroid/view/View;

    return-object v0
.end method

.method public getHeight()I
    .registers 5

    .prologue
    .line 361
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mParentView:Landroid/view/View;

    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mParentView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    iget-object v2, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mParentView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    const/high16 v3, -0x80000000

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->measure(II)V

    .line 363
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mParentView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    return v0
.end method

.method public hide()V
    .registers 2

    .prologue
    .line 417
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mSnackContainer:Lcom/github/mrengineer13/snackbar/SnackContainer;

    invoke-virtual {v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->hide()V

    .line 418
    invoke-virtual {p0}, Lcom/github/mrengineer13/snackbar/SnackBar;->clear()V

    .line 419
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 426
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mSnackContainer:Lcom/github/mrengineer13/snackbar/SnackContainer;

    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mParentView:Landroid/view/View;

    invoke-virtual {v0, p1, v1}, Lcom/github/mrengineer13/snackbar/SnackContainer;->restoreState(Landroid/os/Bundle;Landroid/view/View;)V

    .line 427
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Bundle;
    .registers 2

    .prologue
    .line 430
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar;->mSnackContainer:Lcom/github/mrengineer13/snackbar/SnackContainer;

    invoke-virtual {v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->saveState()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method
