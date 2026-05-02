.class public Lfreemarker/core/InvalidReferenceException;
.super Lfreemarker/template/TemplateException;
.source "InvalidReferenceException.java"


# static fields
.field static final FAST_INSTANCE:Lfreemarker/core/InvalidReferenceException;

.field private static final TIP:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 64
    new-instance v0, Lfreemarker/core/InvalidReferenceException;

    const-string v1, "Invalid reference. Details are unavilable, as this should have been handled by an FTL construct. If it wasn\'t, that\'s problably a bug in FreeMarker."

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lfreemarker/core/InvalidReferenceException;-><init>(Ljava/lang/String;Lfreemarker/core/Environment;)V

    sput-object v0, Lfreemarker/core/InvalidReferenceException;->FAST_INSTANCE:Lfreemarker/core/InvalidReferenceException;

    .line 69
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "If the failing expression is known to be legally null/missing, either specify a default value with myOptionalVar!myDefault, or use "

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "<#if myOptionalVar??>"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "when-present"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "<#else>"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "when-missing"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "</#if>"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, ". (These only cover the last step of the expression; to cover the whole expression, use parenthessis: (myOptionVar.foo)!myDefault, (myOptionVar.foo)??"

    aput-object v2, v0, v1

    sput-object v0, Lfreemarker/core/InvalidReferenceException;->TIP:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 78
    const-string v0, "Invalid reference"

    invoke-direct {p0, v0, p1}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 79
    return-void
.end method

.method constructor <init>(Lfreemarker/core/_ErrorDescriptionBuilder;Lfreemarker/core/Environment;)V
    .registers 5
    .param p1, "description"    # Lfreemarker/core/_ErrorDescriptionBuilder;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 86
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, p2, p1, v1}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V

    .line 87
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 82
    invoke-direct {p0, p1, p2}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 83
    return-void
.end method

.method static getInstance(Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Lfreemarker/core/InvalidReferenceException;
    .registers 5
    .param p0, "blame"    # Lfreemarker/core/Expression;
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 94
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Lfreemarker/core/Environment;->getFastInvalidReferenceExceptions()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 95
    sget-object v0, Lfreemarker/core/InvalidReferenceException;->FAST_INSTANCE:Lfreemarker/core/InvalidReferenceException;

    .line 104
    :goto_a
    return-object v0

    .line 97
    :cond_b
    if-eqz p0, :cond_24

    .line 98
    new-instance v0, Lfreemarker/core/InvalidReferenceException;

    new-instance v1, Lfreemarker/core/_ErrorDescriptionBuilder;

    const-string v2, "The following has evaluated to null or missing:"

    invoke-direct {v1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Lfreemarker/core/_ErrorDescriptionBuilder;->blame(Lfreemarker/core/Expression;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v1

    sget-object v2, Lfreemarker/core/InvalidReferenceException;->TIP:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;->tip([Ljava/lang/Object;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lfreemarker/core/InvalidReferenceException;-><init>(Lfreemarker/core/_ErrorDescriptionBuilder;Lfreemarker/core/Environment;)V

    goto :goto_a

    .line 104
    :cond_24
    new-instance v0, Lfreemarker/core/InvalidReferenceException;

    invoke-direct {v0, p1}, Lfreemarker/core/InvalidReferenceException;-><init>(Lfreemarker/core/Environment;)V

    goto :goto_a
.end method
