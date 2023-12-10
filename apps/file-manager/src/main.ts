import { exec } from "child_process";

export const handler = async () => {
    console.log('AWS_EFS_LOCAL_PATH:', process.env.AWS_EFS_LOCAL_PATH)

    await copyFileToEFS('./efs-test-file.png', process.env.AWS_EFS_LOCAL_PATH)
}

async function copyFileToEFS(inputPath: string, targetPath?: string): Promise<void> {
    const command = `cp ${inputPath} ${targetPath}`;

    await execPromise(command);
}

async function execPromise(command: string): Promise<void> {
    console.log(command)

    return new Promise((resolve, reject) => {
        const ls = exec(command, function (error, stdout, stderr) {
            if (error) {
                console.log('Error: ', error)
                reject(error)
            }
            console.log('stdout: ', stdout);
            console.log('stderr: ', stderr);
        })

        ls.on('exit', function (code) {
            console.log('Finished: ', code);
            resolve()
        })
    })
}