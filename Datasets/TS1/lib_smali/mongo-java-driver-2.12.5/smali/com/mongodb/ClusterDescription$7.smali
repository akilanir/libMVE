.class Lcom/mongodb/ClusterDescription$7;
.super Ljava/lang/Object;
.source "ClusterDescription.java"

# interfaces
.implements Lcom/mongodb/ClusterDescription$Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/ClusterDescription;->getAnyPrimaryOrSecondary(Lcom/mongodb/Tags;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/ClusterDescription;

.field final synthetic val$tags:Lcom/mongodb/Tags;


# direct methods
.method constructor <init>(Lcom/mongodb/ClusterDescription;Lcom/mongodb/Tags;)V
    .registers 3

    .prologue
    .line 143
    iput-object p1, p0, Lcom/mongodb/ClusterDescription$7;->this$0:Lcom/mongodb/ClusterDescription;

    iput-object p2, p0, Lcom/mongodb/ClusterDescription$7;->val$tags:Lcom/mongodb/Tags;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/mongodb/ServerDescription;)Z
    .registers 3
    .param p1, "serverDescription"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 145
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->isPrimary()Z

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->isSecondary()Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_c
    iget-object v0, p0, Lcom/mongodb/ClusterDescription$7;->val$tags:Lcom/mongodb/Tags;

    invoke-virtual {p1, v0}, Lcom/mongodb/ServerDescription;->hasTags(Lcom/mongodb/Tags;)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method
