.class final Lfreemarker/template/TemplateBooleanModel$2;
.super Ljava/lang/Object;
.source "TemplateBooleanModel.java"

# interfaces
.implements Lfreemarker/template/TemplateBooleanModel;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 85
    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    return-object v0
.end method


# virtual methods
.method public getAsBoolean()Z
    .registers 2

    .prologue
    .line 82
    const/4 v0, 0x1

    return v0
.end method
