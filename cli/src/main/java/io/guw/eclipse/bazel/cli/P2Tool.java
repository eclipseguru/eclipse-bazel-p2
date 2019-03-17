/**
 * Copyright (c) 2019 Salesforce and others.
 * All rights reserved.
 *
 * This program and the accompanying materials are made available under the terms of the
 * Eclipse Public License v1.0 which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Gunnar Wagenknecht - initial API and implementation
 */
package io.guw.eclipse.bazel.cli;

import java.util.concurrent.Callable;

import picocli.CommandLine;
import picocli.CommandLine.Command;

/**
 * P2 Tool for generating Bazel Build and Workspace files
 */
@Command(name = "p2-tool", description = "Generate Bazel files for building Eclipse p2 Software Sites")
public class P2Tool implements Callable<Void> {

	public static void main(String[] args) {
		CommandLine.call(new P2Tool(), args);
	}

	@Override
	public Void call() throws Exception {
		System.out.println("Hello");
		return null;
	}
}
