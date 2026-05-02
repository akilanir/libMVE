.class public abstract Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListenerImpl;
.super Ljava/lang/Object;
.source "LibsConfiguration.java"

# interfaces
.implements Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/aboutlibraries/LibsConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "LibsRecyclerViewListenerImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/aboutlibraries/LibsConfiguration;


# direct methods
.method public constructor <init>(Lcom/mikepenz/aboutlibraries/LibsConfiguration;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    .prologue
    .line 233
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListenerImpl;->this$0:Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBindViewHolder(Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;)V
    .registers 2
    .param p1, "headerViewHolder"    # Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;

    .prologue
    .line 236
    return-void
.end method

.method public onBindViewHolder(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;)V
    .registers 2
    .param p1, "holder"    # Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;

    .prologue
    .line 240
    return-void
.end method
