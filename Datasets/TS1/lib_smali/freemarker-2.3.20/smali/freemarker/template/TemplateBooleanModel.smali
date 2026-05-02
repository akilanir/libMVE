.class public interface abstract Lfreemarker/template/TemplateBooleanModel;
.super Ljava/lang/Object;
.source "TemplateBooleanModel.java"

# interfaces
.implements Lfreemarker/template/TemplateModel;


# static fields
.field public static final FALSE:Lfreemarker/template/TemplateBooleanModel;

.field public static final TRUE:Lfreemarker/template/TemplateBooleanModel;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 68
    new-instance v0, Lfreemarker/template/TemplateBooleanModel$1;

    invoke-direct {v0}, Lfreemarker/template/TemplateBooleanModel$1;-><init>()V

    sput-object v0, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    .line 80
    new-instance v0, Lfreemarker/template/TemplateBooleanModel$2;

    invoke-direct {v0}, Lfreemarker/template/TemplateBooleanModel$2;-><init>()V

    sput-object v0, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    return-void
.end method


# virtual methods
.method public abstract getAsBoolean()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation
.end method
