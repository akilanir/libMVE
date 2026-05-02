.class Luk/co/chrisjenx/calligraphy/CalligraphyFactory$1;
.super Ljava/lang/Object;
.source "CalligraphyFactory.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->onViewCreatedInternal(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Luk/co/chrisjenx/calligraphy/CalligraphyFactory;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$parent:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Luk/co/chrisjenx/calligraphy/CalligraphyFactory;Landroid/view/ViewGroup;Landroid/content/Context;)V
    .registers 4
    .param p1, "this$0"    # Luk/co/chrisjenx/calligraphy/CalligraphyFactory;

    .prologue
    .line 159
    iput-object p1, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory$1;->this$0:Luk/co/chrisjenx/calligraphy/CalligraphyFactory;

    iput-object p2, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory$1;->val$parent:Landroid/view/ViewGroup;

    iput-object p3, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 7
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 163
    iget-object v2, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory$1;->val$parent:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 164
    .local v0, "childCount":I
    if-eqz v0, :cond_1c

    .line 166
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    if-ge v1, v0, :cond_1c

    .line 167
    iget-object v2, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory$1;->this$0:Luk/co/chrisjenx/calligraphy/CalligraphyFactory;

    iget-object v3, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory$1;->val$parent:Landroid/view/ViewGroup;

    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    iget-object v4, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory$1;->val$context:Landroid/content/Context;

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->onViewCreated(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    .line 166
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 172
    .end local v1    # "i":I
    :cond_1c
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-ge v2, v3, :cond_2c

    .line 174
    iget-object v2, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory$1;->val$parent:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 178
    :goto_2b
    return-void

    .line 176
    :cond_2c
    iget-object v2, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory$1;->val$parent:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_2b
.end method
