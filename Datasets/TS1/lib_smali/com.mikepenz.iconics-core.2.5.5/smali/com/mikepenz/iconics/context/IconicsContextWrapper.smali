.class public Lcom/mikepenz/iconics/context/IconicsContextWrapper;
.super Landroid/content/ContextWrapper;
.source "IconicsContextWrapper.java"


# instance fields
.field private mInflater:Landroid/view/LayoutInflater;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "base"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    .line 18
    return-void
.end method

.method public static wrap(Landroid/content/Context;)Landroid/content/ContextWrapper;
    .registers 2
    .param p0, "base"    # Landroid/content/Context;

    .prologue
    .line 21
    new-instance v0, Lcom/mikepenz/iconics/context/IconicsContextWrapper;

    invoke-direct {v0, p0}, Lcom/mikepenz/iconics/context/IconicsContextWrapper;-><init>(Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public getResources()Landroid/content/res/Resources;
    .registers 2

    .prologue
    .line 26
    invoke-super {p0}, Landroid/content/ContextWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method public getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 31
    const-string v0, "layout_inflater"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 32
    iget-object v0, p0, Lcom/mikepenz/iconics/context/IconicsContextWrapper;->mInflater:Landroid/view/LayoutInflater;

    if-nez v0, :cond_1c

    .line 33
    new-instance v0, Lcom/mikepenz/iconics/context/InternalLayoutInflater;

    invoke-virtual {p0}, Lcom/mikepenz/iconics/context/IconicsContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, v2}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;-><init>(Landroid/view/LayoutInflater;Landroid/content/Context;Z)V

    iput-object v0, p0, Lcom/mikepenz/iconics/context/IconicsContextWrapper;->mInflater:Landroid/view/LayoutInflater;

    .line 35
    :cond_1c
    iget-object v0, p0, Lcom/mikepenz/iconics/context/IconicsContextWrapper;->mInflater:Landroid/view/LayoutInflater;

    .line 37
    :goto_1e
    return-object v0

    :cond_1f
    invoke-super {p0, p1}, Landroid/content/ContextWrapper;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1e
.end method
