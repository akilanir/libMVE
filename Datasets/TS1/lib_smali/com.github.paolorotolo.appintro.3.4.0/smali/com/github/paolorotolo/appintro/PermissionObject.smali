.class public Lcom/github/paolorotolo/appintro/PermissionObject;
.super Ljava/lang/Object;
.source "PermissionObject.java"


# instance fields
.field permission:[Ljava/lang/String;

.field position:I


# direct methods
.method public constructor <init>([Ljava/lang/String;I)V
    .registers 3
    .param p1, "permission"    # [Ljava/lang/String;
    .param p2, "position"    # I

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/PermissionObject;->permission:[Ljava/lang/String;

    .line 10
    iput p2, p0, Lcom/github/paolorotolo/appintro/PermissionObject;->position:I

    .line 11
    return-void
.end method


# virtual methods
.method public getPermission()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 14
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/PermissionObject;->permission:[Ljava/lang/String;

    return-object v0
.end method

.method public getPosition()I
    .registers 2

    .prologue
    .line 18
    iget v0, p0, Lcom/github/paolorotolo/appintro/PermissionObject;->position:I

    return v0
.end method
