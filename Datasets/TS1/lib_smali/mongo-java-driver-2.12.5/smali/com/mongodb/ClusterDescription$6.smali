.class Lcom/mongodb/ClusterDescription$6;
.super Ljava/lang/Object;
.source "ClusterDescription.java"

# interfaces
.implements Lcom/mongodb/ClusterDescription$Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/ClusterDescription;->getAnyPrimaryOrSecondary()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/ClusterDescription;


# direct methods
.method constructor <init>(Lcom/mongodb/ClusterDescription;)V
    .registers 2

    .prologue
    .line 135
    iput-object p1, p0, Lcom/mongodb/ClusterDescription$6;->this$0:Lcom/mongodb/ClusterDescription;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/mongodb/ServerDescription;)Z
    .registers 3
    .param p1, "serverDescription"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 137
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->isPrimary()Z

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->isSecondary()Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method
