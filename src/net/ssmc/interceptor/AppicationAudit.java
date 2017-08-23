package net.ssmc.interceptor;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import net.ssmc.enums.Access;
import net.ssmc.enums.Module;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD) //can use in method only.
public @interface AppicationAudit{
	
	Module module();
	Access access();
}