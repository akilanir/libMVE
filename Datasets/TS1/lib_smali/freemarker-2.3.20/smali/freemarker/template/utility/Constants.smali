.class public Lfreemarker/template/utility/Constants;
.super Ljava/lang/Object;
.source "Constants.java"


# static fields
.field public static final EMPTY_COLLECTION:Lfreemarker/template/TemplateCollectionModel;

.field public static final EMPTY_HASH:Lfreemarker/template/TemplateHashModelEx;

.field public static final EMPTY_ITERATOR:Lfreemarker/template/TemplateModelIterator;

.field public static final EMPTY_SEQUENCE:Lfreemarker/template/TemplateSequenceModel;

.field public static final EMPTY_STRING:Lfreemarker/template/TemplateScalarModel;

.field public static final FALSE:Lfreemarker/template/TemplateBooleanModel;

.field public static final MINUS_ONE:Lfreemarker/template/TemplateNumberModel;

.field public static final ONE:Lfreemarker/template/TemplateNumberModel;

.field public static final TRUE:Lfreemarker/template/TemplateBooleanModel;

.field public static final ZERO:Lfreemarker/template/TemplateNumberModel;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 77
    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    sput-object v0, Lfreemarker/template/utility/Constants;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    .line 79
    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    sput-object v0, Lfreemarker/template/utility/Constants;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    .line 81
    sget-object v0, Lfreemarker/template/TemplateScalarModel;->EMPTY_STRING:Lfreemarker/template/TemplateModel;

    check-cast v0, Lfreemarker/template/TemplateScalarModel;

    sput-object v0, Lfreemarker/template/utility/Constants;->EMPTY_STRING:Lfreemarker/template/TemplateScalarModel;

    .line 83
    new-instance v0, Lfreemarker/template/SimpleNumber;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleNumber;-><init>(I)V

    sput-object v0, Lfreemarker/template/utility/Constants;->ZERO:Lfreemarker/template/TemplateNumberModel;

    .line 85
    new-instance v0, Lfreemarker/template/SimpleNumber;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleNumber;-><init>(I)V

    sput-object v0, Lfreemarker/template/utility/Constants;->ONE:Lfreemarker/template/TemplateNumberModel;

    .line 87
    new-instance v0, Lfreemarker/template/SimpleNumber;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleNumber;-><init>(I)V

    sput-object v0, Lfreemarker/template/utility/Constants;->MINUS_ONE:Lfreemarker/template/TemplateNumberModel;

    .line 89
    new-instance v0, Lfreemarker/template/utility/Constants$1;

    invoke-direct {v0}, Lfreemarker/template/utility/Constants$1;-><init>()V

    sput-object v0, Lfreemarker/template/utility/Constants;->EMPTY_ITERATOR:Lfreemarker/template/TemplateModelIterator;

    .line 101
    new-instance v0, Lfreemarker/template/utility/Constants$2;

    invoke-direct {v0}, Lfreemarker/template/utility/Constants$2;-><init>()V

    sput-object v0, Lfreemarker/template/utility/Constants;->EMPTY_COLLECTION:Lfreemarker/template/TemplateCollectionModel;

    .line 109
    new-instance v0, Lfreemarker/template/utility/Constants$3;

    invoke-direct {v0}, Lfreemarker/template/utility/Constants$3;-><init>()V

    sput-object v0, Lfreemarker/template/utility/Constants;->EMPTY_SEQUENCE:Lfreemarker/template/TemplateSequenceModel;

    .line 122
    new-instance v0, Lfreemarker/template/utility/Constants$4;

    invoke-direct {v0}, Lfreemarker/template/utility/Constants$4;-><init>()V

    sput-object v0, Lfreemarker/template/utility/Constants;->EMPTY_HASH:Lfreemarker/template/TemplateHashModelEx;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
