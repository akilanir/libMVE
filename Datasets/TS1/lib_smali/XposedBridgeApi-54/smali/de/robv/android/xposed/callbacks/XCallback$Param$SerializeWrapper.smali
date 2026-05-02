.class Lde/robv/android/xposed/callbacks/XCallback$Param$SerializeWrapper;
.super Ljava/lang/Object;
.source "XCallback.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/callbacks/XCallback$Param;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SerializeWrapper"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private object:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lde/robv/android/xposed/callbacks/XCallback$Param$SerializeWrapper;->object:Ljava/lang/Object;

    .line 60
    return-void
.end method

.method static synthetic access$0(Lde/robv/android/xposed/callbacks/XCallback$Param$SerializeWrapper;)Ljava/lang/Object;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lde/robv/android/xposed/callbacks/XCallback$Param$SerializeWrapper;->object:Ljava/lang/Object;

    return-object v0
.end method
