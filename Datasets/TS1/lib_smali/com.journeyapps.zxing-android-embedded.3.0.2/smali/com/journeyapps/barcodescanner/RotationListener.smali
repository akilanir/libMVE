.class public Lcom/journeyapps/barcodescanner/RotationListener;
.super Ljava/lang/Object;
.source "RotationListener.java"


# instance fields
.field private callback:Lcom/journeyapps/barcodescanner/RotationCallback;

.field private lastRotation:I

.field private orientationEventListener:Landroid/view/OrientationEventListener;

.field private windowManager:Landroid/view/WindowManager;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method static synthetic access$000(Lcom/journeyapps/barcodescanner/RotationListener;)Landroid/view/WindowManager;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/RotationListener;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/RotationListener;->windowManager:Landroid/view/WindowManager;

    return-object v0
.end method

.method static synthetic access$100(Lcom/journeyapps/barcodescanner/RotationListener;)Lcom/journeyapps/barcodescanner/RotationCallback;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/RotationListener;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/RotationListener;->callback:Lcom/journeyapps/barcodescanner/RotationCallback;

    return-object v0
.end method

.method static synthetic access$200(Lcom/journeyapps/barcodescanner/RotationListener;)I
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/RotationListener;

    .prologue
    .line 16
    iget v0, p0, Lcom/journeyapps/barcodescanner/RotationListener;->lastRotation:I

    return v0
.end method

.method static synthetic access$202(Lcom/journeyapps/barcodescanner/RotationListener;I)I
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/RotationListener;
    .param p1, "x1"    # I

    .prologue
    .line 16
    iput p1, p0, Lcom/journeyapps/barcodescanner/RotationListener;->lastRotation:I

    return p1
.end method


# virtual methods
.method public listen(Landroid/content/Context;Lcom/journeyapps/barcodescanner/RotationCallback;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "callback"    # Lcom/journeyapps/barcodescanner/RotationCallback;

    .prologue
    .line 29
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/RotationListener;->stop()V

    .line 33
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 35
    iput-object p2, p0, Lcom/journeyapps/barcodescanner/RotationListener;->callback:Lcom/journeyapps/barcodescanner/RotationCallback;

    .line 37
    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/RotationListener;->windowManager:Landroid/view/WindowManager;

    .line 40
    new-instance v0, Lcom/journeyapps/barcodescanner/RotationListener$1;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p1, v1}, Lcom/journeyapps/barcodescanner/RotationListener$1;-><init>(Lcom/journeyapps/barcodescanner/RotationListener;Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/RotationListener;->orientationEventListener:Landroid/view/OrientationEventListener;

    .line 54
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/RotationListener;->orientationEventListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->enable()V

    .line 56
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/RotationListener;->windowManager:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    iput v0, p0, Lcom/journeyapps/barcodescanner/RotationListener;->lastRotation:I

    .line 57
    return-void
.end method

.method public stop()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 62
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/RotationListener;->orientationEventListener:Landroid/view/OrientationEventListener;

    if-eqz v0, :cond_a

    .line 63
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/RotationListener;->orientationEventListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->disable()V

    .line 65
    :cond_a
    iput-object v1, p0, Lcom/journeyapps/barcodescanner/RotationListener;->orientationEventListener:Landroid/view/OrientationEventListener;

    .line 66
    iput-object v1, p0, Lcom/journeyapps/barcodescanner/RotationListener;->windowManager:Landroid/view/WindowManager;

    .line 67
    iput-object v1, p0, Lcom/journeyapps/barcodescanner/RotationListener;->callback:Lcom/journeyapps/barcodescanner/RotationCallback;

    .line 68
    return-void
.end method
