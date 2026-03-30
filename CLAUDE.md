# Description

These are a set of rules that should be applied all the time and in all kind of scenarios.

## Important Rules

- Do not add unit tests.
- Do not add E2E tests.
- Reuse existing patterns before adding abstractions.
- For non-trivial tasks, do read-only discovery first.
- Produce a file-by-file plan before implementation.
- Do not broaden scope without stating the delta.
- Verify changes with the narrowest relevant checks.
- Prefer minimal diffs.
- Do not change architecture unless the task explicitly asks for it.
- For backend changes, inspect related models, handlers, services, routes, migrations, and config before editing.
- State assumptions explicitly before implementation.
- Do not add dependencies unless required.
- Verification must match task risk:
- small UI/text change: local visual/manual verification
- business logic change: run the narrowest relevant checks
- data/auth/payment/infrastructure change: add an explicit risk review
- Always check the code and undrestand it before creating the plan.
- Do an complete investigation on project for plans to undrestand the project and the provided documentations.
- Make plans concise and striaghtforward and deep, avoid emojis, header, bold, etc fonts, just something that working simply and readable easier and striaghtforwardnd and complete
  , non neccary or duplicated things, make them easier and faster to read.
  to date with current project situation, it should be kept up to date all the time, I not mean to always extend it, My mean is revalidate it to didn't havy any
  wrong information.
- In TypeScript coding never use `any` type, instead create proper types or interfaces and use them, or other best practices.
- In TypeScript coding never recreate the types, enums, interfaces unless it's needed for a powerfull reason instead reuse them to make project typesafe.
- Create the type inside the service/controller/function/method/utill/page/component that it used, unless it's used also in other place so you should move it to
  Some other directory and file. e.g: common/types OR common/interfaces OR etc common/{interfaces,types}/<module-name> if folder files are so much.
- Always check lint errors and type errors in the end of code changes, you can usually do it with scripts that exists inside package.json like `npm run lint` OR `npm run build` OR `npm run format`. For frontend projects, also run `npm run check` when it exists because it can bundle the required verification steps.
- Always create migrations using ORM specific command that I usually create inside package.json and you create the migration only by running it through the terminal and
  just giving the name, and never write migrations yourself unless it's not possible with ORM.
- Never write `//` OR `/** */` OR any other type of comment in code instead write the code in a way that it's descriptive and don't need for reading commets to undrestand
  it, also do not create .md files are any other instructions files for features. Just update project `README.md` proparly for changes.
- Keep code and solutions simple, avoid complexifying, write the code in a way that human can easily read and undrestand/maintain/debug/extend.
- Always follow project architucture/naming convetions/exports/module system/infra/coding style restrictly.
- Ask question if something is not clear for you OR you think you need more context, etc.
- Do not commit or `git add` the changes, do not commit, do not push the code, do not do anything with git.
- Do not create .md files for instructions, etc. only you can update project `README.md` for updating ENVs, etc.
- Always update sample ENV files or even also the main .env files to add new ENVs when you used them inside code, etc.
- If project uses task-definition.josn file for defining ENVs, Update `./infra/task-definition.json` file when you add new ENV or secret (For these also let me know to update them in AWS System Manager).
- When I want you to plan, alongside of my explainations in initial prompt you should analyse project and also check internet or skills, MCPs to find most correct and up to
  date information and knowledge about that challenge, and then provide them to me, if I said something wrong and you ensured that it was wrong tell me that in plan.
- Do not run docker commands or applying migrations on DB, let myself do it.
- Keep project and code organised and do separation of concerns.
- Do not do duplications on, first check for existence of utils, components, fuctions, types, etc and then if not exists create new thing.
- When you create a folder of utils, types, interfaces, etc create a index.ts file to export all things inside folder, expect for some scenarios that it's not possible.
- If a function, method, etc don't have any `await` do not use `async` for it, or if a function have async always use `await` for it when you call it.
- Try to not use `any`, `unknown`, `{}`, `Record<string, any>`, instead find the related type from the project or library types, etc.
- If you realized something is wrong in the database setup and migrations, first try to fix it using already setted up migration system
  and avoid creating separate sql files to apply manually.
