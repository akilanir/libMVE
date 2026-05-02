.class public final enum Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;
.super Ljava/lang/Enum;
.source "SharedPref.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Scope"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

.field public static final enum ACTIVITY:Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

.field public static final enum ACTIVITY_DEFAULT:Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

.field public static final enum APPLICATION_DEFAULT:Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

.field public static final enum UNIQUE:Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 34
    new-instance v0, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    const-string v1, "APPLICATION_DEFAULT"

    invoke-direct {v0, v1, v2}, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;->APPLICATION_DEFAULT:Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    new-instance v0, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    const-string v1, "ACTIVITY"

    invoke-direct {v0, v1, v3}, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;->ACTIVITY:Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    new-instance v0, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    const-string v1, "ACTIVITY_DEFAULT"

    invoke-direct {v0, v1, v4}, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;->ACTIVITY_DEFAULT:Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    new-instance v0, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    const-string v1, "UNIQUE"

    invoke-direct {v0, v1, v5}, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;->UNIQUE:Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    .line 33
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    sget-object v1, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;->APPLICATION_DEFAULT:Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    aput-object v1, v0, v2

    sget-object v1, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;->ACTIVITY:Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    aput-object v1, v0, v3

    sget-object v1, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;->ACTIVITY_DEFAULT:Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    aput-object v1, v0, v4

    sget-object v1, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;->UNIQUE:Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    aput-object v1, v0, v5

    sput-object v0, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;->$VALUES:[Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 33
    const-class v0, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    return-object v0
.end method

.method public static values()[Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;
    .registers 1

    .prologue
    .line 33
    sget-object v0, Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;->$VALUES:[Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    invoke-virtual {v0}, [Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope;

    return-object v0
.end method
