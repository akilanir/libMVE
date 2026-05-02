.class public Landroid/content/res/XResForwarder;
.super Ljava/lang/Object;
.source "XResForwarder.java"


# instance fields
.field private final id:I

.field private final res:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;I)V
    .registers 3
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "id"    # I

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Landroid/content/res/XResForwarder;->res:Landroid/content/res/Resources;

    .line 14
    iput p2, p0, Landroid/content/res/XResForwarder;->id:I

    .line 15
    return-void
.end method


# virtual methods
.method public getId()I
    .registers 2

    .prologue
    .line 22
    iget v0, p0, Landroid/content/res/XResForwarder;->id:I

    return v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .registers 2

    .prologue
    .line 18
    iget-object v0, p0, Landroid/content/res/XResForwarder;->res:Landroid/content/res/Resources;

    return-object v0
.end method
