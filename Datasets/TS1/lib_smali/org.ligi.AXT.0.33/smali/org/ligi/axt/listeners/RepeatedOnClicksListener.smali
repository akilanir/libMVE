.class public Lorg/ligi/axt/listeners/RepeatedOnClicksListener;
.super Ljava/lang/Object;
.source "RepeatedOnClicksListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private actClicksBeforeFiring:I

.field private callCount:I

.field private final configuredClicksBeforeFiring:I

.field private final listener:Landroid/view/View$OnClickListener;

.field private repeatsAreAllowed:Z


# direct methods
.method public constructor <init>(ILandroid/view/View$OnClickListener;)V
    .registers 4
    .param p1, "clickCountBeforeFire"    # I
    .param p2, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->repeatsAreAllowed:Z

    .line 14
    iput-object p2, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->listener:Landroid/view/View$OnClickListener;

    .line 15
    iput p1, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->configuredClicksBeforeFiring:I

    .line 16
    iget v0, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->configuredClicksBeforeFiring:I

    iput v0, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->actClicksBeforeFiring:I

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->callCount:I

    .line 18
    return-void
.end method


# virtual methods
.method public doNotRepeatCalls()Lorg/ligi/axt/listeners/RepeatedOnClicksListener;
    .registers 2

    .prologue
    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->repeatsAreAllowed:Z

    .line 33
    return-object p0
.end method

.method public getCallCount()I
    .registers 2

    .prologue
    .line 37
    iget v0, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->callCount:I

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 22
    iget v0, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->callCount:I

    if-eqz v0, :cond_8

    iget-boolean v0, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->repeatsAreAllowed:Z

    if-eqz v0, :cond_1f

    .line 23
    :cond_8
    iget v0, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->actClicksBeforeFiring:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->actClicksBeforeFiring:I

    if-gtz v0, :cond_1f

    .line 24
    iget-object v0, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->listener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 25
    iget v0, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->configuredClicksBeforeFiring:I

    iput v0, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->actClicksBeforeFiring:I

    .line 26
    iget v0, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->callCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/ligi/axt/listeners/RepeatedOnClicksListener;->callCount:I

    .line 29
    :cond_1f
    return-void
.end method
