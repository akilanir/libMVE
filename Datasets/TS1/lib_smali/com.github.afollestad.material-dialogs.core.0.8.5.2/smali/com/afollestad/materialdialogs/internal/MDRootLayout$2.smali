.class Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;
.super Ljava/lang/Object;
.source "MDRootLayout.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnScrollChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/afollestad/materialdialogs/internal/MDRootLayout;->addScrollListener(Landroid/view/ViewGroup;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

.field final synthetic val$setForBottom:Z

.field final synthetic val$setForTop:Z

.field final synthetic val$vg:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Lcom/afollestad/materialdialogs/internal/MDRootLayout;Landroid/view/ViewGroup;ZZ)V
    .registers 5

    .prologue
    .line 446
    iput-object p1, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->this$0:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    iput-object p2, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->val$vg:Landroid/view/ViewGroup;

    iput-boolean p3, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->val$setForTop:Z

    iput-boolean p4, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->val$setForBottom:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollChanged()V
    .registers 10

    .prologue
    .line 449
    const/4 v2, 0x0

    .line 450
    .local v2, "hasButtons":Z
    iget-object v5, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->this$0:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    # getter for: Lcom/afollestad/materialdialogs/internal/MDRootLayout;->mButtons:[Lcom/afollestad/materialdialogs/internal/MDButton;
    invoke-static {v5}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->access$400(Lcom/afollestad/materialdialogs/internal/MDRootLayout;)[Lcom/afollestad/materialdialogs/internal/MDButton;

    move-result-object v0

    .local v0, "arr$":[Lcom/afollestad/materialdialogs/internal/MDButton;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_9
    if-ge v3, v4, :cond_18

    aget-object v1, v0, v3

    .line 451
    .local v1, "button":Lcom/afollestad/materialdialogs/internal/MDButton;
    if-eqz v1, :cond_31

    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->getVisibility()I

    move-result v5

    const/16 v6, 0x8

    if-eq v5, v6, :cond_31

    .line 452
    const/4 v2, 0x1

    .line 456
    .end local v1    # "button":Lcom/afollestad/materialdialogs/internal/MDButton;
    :cond_18
    iget-object v5, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->val$vg:Landroid/view/ViewGroup;

    instance-of v5, v5, Landroid/webkit/WebView;

    if-eqz v5, :cond_34

    .line 457
    iget-object v6, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->this$0:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    iget-object v5, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->val$vg:Landroid/view/ViewGroup;

    check-cast v5, Landroid/webkit/WebView;

    iget-boolean v7, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->val$setForTop:Z

    iget-boolean v8, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->val$setForBottom:Z

    # invokes: Lcom/afollestad/materialdialogs/internal/MDRootLayout;->invalidateDividersForWebView(Landroid/webkit/WebView;ZZZ)V
    invoke-static {v6, v5, v7, v8, v2}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->access$500(Lcom/afollestad/materialdialogs/internal/MDRootLayout;Landroid/webkit/WebView;ZZZ)V

    .line 461
    :goto_2b
    iget-object v5, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->this$0:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->invalidate()V

    .line 462
    return-void

    .line 450
    .restart local v1    # "button":Lcom/afollestad/materialdialogs/internal/MDButton;
    :cond_31
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 459
    .end local v1    # "button":Lcom/afollestad/materialdialogs/internal/MDButton;
    :cond_34
    iget-object v5, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->this$0:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    iget-object v6, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->val$vg:Landroid/view/ViewGroup;

    iget-boolean v7, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->val$setForTop:Z

    iget-boolean v8, p0, Lcom/afollestad/materialdialogs/internal/MDRootLayout$2;->val$setForBottom:Z

    # invokes: Lcom/afollestad/materialdialogs/internal/MDRootLayout;->invalidateDividersForScrollingView(Landroid/view/ViewGroup;ZZZ)V
    invoke-static {v5, v6, v7, v8, v2}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->access$600(Lcom/afollestad/materialdialogs/internal/MDRootLayout;Landroid/view/ViewGroup;ZZZ)V

    goto :goto_2b
.end method
